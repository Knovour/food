module Architecture.Main exposing (Model, Msg(..), initialModel, update)

import Task
import Url exposing (Url)
import Browser
import Browser.Navigation as Nav exposing (..)

import Architecture.Action as Action exposing (..)
import Architecture.Box as Box
import Architecture.Content as Content
import Architecture.Filter as Filter
import Architecture.Screen as Screen
import GraphQL.Client.Http as GraphQLClient
import Libs.Graphcool exposing (generateQueryRequest)
import Libs.Helpers exposing (getDictValue)
import Libs.Type exposing (Respond)
import Route exposing (Route(..), getRouteTarget, match)


type alias Model =
  { filter : Filter.Model
  , box : Box.Model
  , action : Action.Model
  , screen : Screen.Model
  , content : Content.Model
  , route : Route
  , key : Nav.Key
  }



initialModel : Url ->  Nav.Key -> Model
initialModel url key =
  { filter = Filter.model
  , box = Box.model
  , action = Action.updateGroup (match url) Action.model
  , screen = Screen.model
  , content = Content.model
  , route = match url
  , key = key
  }


type Msg
  = NoOp
  | Filter Filter.Msg
  | Box Box.Msg
  | Action Action.Msg
  | Screen Screen.Msg
  | Content (Result GraphQLClient.Error Respond)
  | LinkClicked Browser.UrlRequest
  | UrlChanged Url
  | OnLocationChange (Maybe Route)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  let newModel =
        case msg of
          Action actionMsg -> { model | action = Action.update actionMsg model.action }
          Box boxMsg -> { model | box = Box.update boxMsg }
          Filter filterMsg -> { model | filter = Filter.update filterMsg model.filter }
          Screen screenMsg ->
            { model
              | screen = Screen.update screenMsg
              , action = Action.resize screenMsg model.action
            }
          Content contentMsg ->
            { model | content = Content.update contentMsg model.content }
          UrlChanged url ->
            { model
              | route = match url
              , action = Action.updateGroup (match url) model.action
            }
          _ -> model
      newCmd =
        case msg of
          LinkClicked urlRequest ->
            case urlRequest of
              Browser.Internal url ->
                let target = getRouteTarget (match url)
                    targetData = getDictValue target model.content

                    reqContent =
                      if List.length targetData == 0
                      then Task.attempt Content (generateQueryRequest target)
                      else Cmd.none
                in
                  Cmd.batch
                    [ Nav.pushUrl model.key (Url.toString url)
                    , reqContent
                    ]
              Browser.External url -> Nav.load url
          _ -> Cmd.none
  in (newModel, newCmd)

module Architecture.Main exposing (..)
import Http

import Architecture.Search  as Search
import Architecture.Box     as Box
import Architecture.Action  as Action
import Architecture.Screen  as Screen
import Architecture.Content as Content
import Libs.Type exposing (Respond)



type alias Model =
  { search  : Search.Model
  , box     : Box.Model
  , action  : Action.Model
  , screen  : Screen.Model
  , content : Content.Model
  }


model : Model
model =
  { search  = Search.model
  , box     = Box.model
  , action  = Action.model
  , screen  = Screen.model
  , content = Content.model
  }


type Msg
  = NoOp
  | Search Search.Msg
  | Box    Box.Msg
  | Action Action.Msg
  | Screen Screen.Msg
  | Content (Result Http.Error Respond)


update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  let newModel =
        case msg of
          Action  actionMsg  -> { model | action  = (Action.update actionMsg model.action) }
          Box     boxMsg     -> { model | box     = (Box.update boxMsg) }
          Search  searchMsg  -> { model | search  = (Search.update searchMsg model.search) }
          Screen  screenMsg  -> { model | screen  = (Screen.update screenMsg model.screen) }
          Content contentMsg -> { model | content = (Content.update contentMsg model.content) }
          _ -> model
  in (newModel, Cmd.none)

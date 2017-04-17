module Architecture.Main exposing (..)
import Http

import Architecture.Box     as Box
import Architecture.Action  as Action exposing (..)
import Architecture.Screen  as Screen
import Architecture.Content as Content
import Architecture.Filter  as Filter
import Libs.Type exposing (Respond)



type alias Model =
  { filter  : Filter.Model
  , box     : Box.Model
  , action  : Action.Model
  , screen  : Screen.Model
  , content : Content.Model
  }


model : Model
model =
  { filter  = Filter.model
  , box     = Box.model
  , action  = Action.model
  , screen  = Screen.model
  , content = Content.model
  }


type Msg
  = NoOp
  | Filter Filter.Msg
  | Box    Box.Msg
  | Action Action.Msg
  | Screen Screen.Msg
  | Content (Result Http.Error Respond)


update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  let newModel =
        case msg of
          Action actionMsg -> { model | action = (Action.update actionMsg model.action) }
          Box    boxMsg    -> { model | box    = (Box.update boxMsg) }
          Filter filterMsg -> { model | filter = (Filter.update filterMsg model.filter) }
          Screen screenMsg ->
            { model
            | screen = (Screen.update screenMsg model.screen)
            , action = (Action.resize screenMsg model.action)
            }
          Content contentMsg -> { model | content = (Content.update contentMsg model.content) }
          _ -> model
  in (newModel, Cmd.none)

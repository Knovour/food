module Architecture.Main exposing (..)
import Http

import Architecture.Search  as Search
import Architecture.Box     as Box
import Architecture.Action  as Action
import Architecture.Content as Content
import Libs.Type exposing (Respond)



type alias Model =
  { search  : Search.Model
  , box     : Box.Model
  , action  : Action.Model
  , content : Content.Model
  }


model : Model
model =
  { search  = Search.model
  , box     = Box.model
  , action  = Action.model
  , content = Content.model
  }


type Msg
  = NoOp
  | SearchMsg Search.Msg
  | BoxMsg    Box.Msg
  | ActionMsg Action.Msg
  | Content  (Result Http.Error Respond)



update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  let newModel =
        case msg of
          ActionMsg actionMsg  -> { model | action  = (Action.update actionMsg model.action) }
          BoxMsg    boxMsg     -> { model | box     = (Box.update boxMsg) }
          SearchMsg searchMsg  -> { model | search  = (Search.update searchMsg model.search) }
          Content   contentMsg -> { model | content = (Content.update contentMsg model.content) }
          _ -> model
  in (newModel, Cmd.none)

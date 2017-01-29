module Update.Main exposing (..)

import Msg.Main exposing (Msg)
import Model.Main exposing (Model, model)

import Update.Search as Search
import Update.Box as Box
import Update.Action as Action
import Update.Content as Content


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  ({ search = Search.update msg model.search
  , box = Box.update msg model.box
  , action = Action.update msg model.action
  , content = Content.update msg model.content
  }, Cmd.none)

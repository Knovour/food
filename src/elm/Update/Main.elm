module Update.Main exposing (..)

import Msg.Main exposing (Msg)
import Model.Main exposing (Model, model)
import Update.Search as Search
import Update.Box as Box
import Update.Action as Action


update : Msg -> Model -> Model
update msg model =
  { search = Search.update msg model.search
  , box = Box.update msg model.box
  , action = Action.update msg model.action
  }

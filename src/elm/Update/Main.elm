module Update.Main exposing (..)

import Msg.Main exposing (Msg)
import Model.Main exposing (Model, model)
import Update.Month as Month

update : Msg -> Model -> Model
update msg model = {
    month = Month.update msg model.month
  }

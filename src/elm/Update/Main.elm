module Update.Main exposing (..)

import Msg.Main exposing (Msg)
import Model.Main exposing (Model, model)
import Update.Month as Month
import Update.Box as Box


update : Msg -> Model -> Model
update msg model =
  { month = Month.update msg model.month
  , box = Box.update msg model.box
  }

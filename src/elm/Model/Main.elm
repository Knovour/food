module Model.Main exposing (..)

import Model.Month as Month

type alias Model = {
  month : Month.Model
}

model : Model
model = {
    month = Month.model
  }

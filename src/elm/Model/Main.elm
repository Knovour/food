module Model.Main exposing (..)

import Model.Month as Month
import Model.Box as Box


type alias Model =
  { month : Month.Model
  , box : Box.Model
  }


model : Model
model =
  { month = Month.model
  , box = Box.model
  }

module Model.Main exposing (..)

import Model.Month as Month
import Model.Box as Box
import Model.Action as Action


type alias Model =
  { month : Month.Model
  , box : Box.Model
  , action : Action.Model
  }


model : Model
model =
  { month = Month.model
  , box = Box.model
  , action = Action.model
  }

module Model.Main exposing (..)

import Model.Search as Search
import Model.Box as Box
import Model.Action as Action


type alias Model =
  { search : Search.Model
  , box : Box.Model
  , action : Action.Model
  }


model : Model
model =
  { search = Search.model
  , box = Box.model
  , action = Action.model
  }

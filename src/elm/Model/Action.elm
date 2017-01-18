module Model.Action exposing (..)


type alias Model =
  { hover : List Int
  , tag : String
  }


model : Model
model =
  { hover = []
  , tag = "蔬菜"
  }

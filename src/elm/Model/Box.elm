module Model.Box exposing (..)


type alias Model =
  { open : Bool
  , food : String
  }


model : Model
model =
  { open = False
  , food = ""
  }

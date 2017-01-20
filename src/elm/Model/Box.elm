module Model.Box exposing (..)


type alias Model =
  { open : Bool
  , name : String
  }


model : Model
model =
  { open = False
  , name = ""
  }

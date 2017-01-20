module Model.Search exposing (..)


type alias Model =
  { month : List Int
  , name : String
  }


model : Model
model =
  { month = []
  , name = ""
  }

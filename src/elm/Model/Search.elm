module Model.Search exposing (..)


type alias Model =
  { current : Int
  , month : String
  , name : String
  }


model : Model
model =
  { current = 0
  , month = "所有月份"
  , name = ""
  }

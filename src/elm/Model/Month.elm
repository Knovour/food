module Model.Month exposing (..)


type alias Model =
  { current : Int
  , text : String
  }


model : Model
model =
  { current = 0
  , text = "所有月份"
  }

module Architecture.Screen exposing (..)



type alias Model =
  { width : Int
  }


model : Model
model =
  { width = 0
  }


type Msg
  = Width Int


update : Msg -> Model -> Model
update screen model =
  case screen of
    Width w -> { width = w }

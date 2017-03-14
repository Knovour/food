module Architecture.Screen exposing (..)
import Task



type alias Model =
  { width  : Int
  }


model : Model
model =
  { width  = 0
  }


type Msg
  = Width Int


update : Msg -> Model -> Model
update screen model =
  case screen of
    Width w -> { model | width = w }

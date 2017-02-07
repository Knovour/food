module Architecture.Screen exposing (..)
import Task



type alias Model =
  { width  : Int
  , height : Int
  }


model : Model
model =
  { width  = 0
  , height = 0
  }


type Msg
  = Resize Int Int
  | Width Int
  | Height Int


update : Msg -> Model -> Model
update screen model =
  case screen of
    Resize w h -> { width = w, height = h }
    Width  w   -> { model | width = w }
    Height h   -> { model | height = h }

module Architecture.Screen exposing (Model, Msg(..), model, update)


type alias Model = { width : Int }


model : Model
model = { width = 0 }


type Msg = Width Int


update : Msg -> Model
update screen =
  case screen of
    Width w -> { width = w }

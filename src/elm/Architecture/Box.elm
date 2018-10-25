module Architecture.Box exposing (Model, Msg(..), model, update)


type alias Model = { open : Bool }


model : Model
model = { open = False }


type Msg
  = Open
  | Close


update : Msg -> Model
update boxMsg =
  case boxMsg of
    Open -> { open = True }
    Close -> { open = False }

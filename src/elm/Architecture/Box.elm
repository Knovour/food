module Architecture.Box exposing (..)



type alias Model =
  { open : Bool
  , name : String
  }


model : Model
model =
  { open = False
  , name = ""
  }


type Msg
  = Open String
  | Close


update : Msg -> Model
update boxMsg =
  case boxMsg of
    Open str -> { open = True, name = str }
    Close    -> { open = False, name = "" }

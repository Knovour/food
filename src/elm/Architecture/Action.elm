module Architecture.Action exposing (..)



type alias Model =
  { hover : List Int
  , group : String
  , layout : String
  , tag : String
  }


model : Model
model =
  { hover = []
  , group = "蔬菜"
  , layout = "apps"
  , tag = "分頁"
  }


type Msg
  = Hover (List Int)
  | Group String
  | Layout String
  | Tag String


update : Msg -> Model -> Model
update actionMsg model =
  case actionMsg of
    Hover  list -> { model | hover  = list }
    Group  str  -> { model | group  = str }
    Layout str  -> { model | layout = str }
    Tag    str  -> { model | tag    = str }

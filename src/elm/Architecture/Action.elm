module Architecture.Action exposing (..)



type alias Model =
  { hover   : List Int
  , group   : String
  , sidebar : String
  , layout  : String
  , showBy  : String
  , toggleSearch  : String
  }


model : Model
model =
  { hover   = []
  , group   = "蔬菜"
  , sidebar = "open"
  , layout  = "apps"
  , showBy  = "分頁"
  , toggleSearch  = "open"
  }


type Msg
  = Hover  (List Int)
  | Group   String
  | Sidebar String
  | Layout  String
  | ShowBy  String
  | ToggleSearch String


update : Msg -> Model -> Model
update actionMsg model =
  case actionMsg of
    Hover   list -> { model | hover  = list }
    Group   str  -> { model | group  = str }
    Sidebar str  -> { model | sidebar = str }
    Layout  str  -> { model | layout = str }
    ShowBy  str  -> { model | showBy = str }
    ToggleSearch str  -> { model | toggleSearch = str }

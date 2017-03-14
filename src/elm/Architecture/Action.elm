module Architecture.Action exposing (..)



type alias Model =
  { hover   : List Int
  , group   : String
  , layout  : String
  , showBy  : String
  , toggleSidebar : Bool
  , toggleAction  : Bool
  }


model : Model
model =
  { hover  = []
  , group  = "蔬菜"
  , layout = "apps"
  , showBy = "分頁"
  , toggleSidebar = True
  , toggleAction  = False
  }


type Msg
  = Hover (List Int)
  | Group  String
  | Layout String
  | ShowBy String
  | ToggleSidebar
  | ToggleAction


update : Msg -> Model -> Model
update actionMsg model =
  case actionMsg of
    Hover  list -> { model | hover  = list }
    Group  str  -> { model | group  = str }
    Layout str  -> { model | layout = str }
    ShowBy str  -> { model | showBy = str }
    ToggleSidebar -> { model | toggleSidebar = (not model.toggleSidebar) }
    ToggleAction  -> { model | toggleAction = (not model.toggleAction) }

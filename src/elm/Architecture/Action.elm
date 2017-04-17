module Architecture.Action exposing (..)

import Architecture.Screen as Screen exposing (..)



type alias Model =
  { hover : List Int
  , group : String
  , isGroupByTab : Bool
  , isCardLayout : Bool
  , toggleSidebar : Bool
  , toggleActionBtn : Bool
  }


model : Model
model =
  { hover = []
  , group = "蔬菜"
  , isGroupByTab = True
  , isCardLayout = True
  , toggleSidebar = True
  , toggleActionBtn = False
  }


type Msg
  = Hover (List Int)
  | Group String
  | IsGroupByTab
  | IsCardLayout
  | ToggleSidebar
  | ToggleActionBtn


update : Msg -> Model -> Model
update actionMsg model =
  case actionMsg of
    Hover list      -> { model | hover = list }
    Group str       -> { model | group = str }
    IsGroupByTab    -> { model | isGroupByTab = (not model.isGroupByTab) }
    IsCardLayout    -> { model | isCardLayout = (not model.isCardLayout) }
    ToggleSidebar   -> { model | toggleSidebar = (not model.toggleSidebar) }
    ToggleActionBtn -> { model | toggleActionBtn = (not model.toggleActionBtn) }


resize : Screen.Msg -> Model -> Model
resize screenMsg model =
  case screenMsg of
    Width w ->
      { model
      | isCardLayout = (w <= 1120 || model.isCardLayout)
      , isGroupByTab = (w <= 1120 || model.isGroupByTab)
      }

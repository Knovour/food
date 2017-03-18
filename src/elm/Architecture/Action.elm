module Architecture.Action exposing (..)

import Architecture.Screen as Screen exposing (..)



type alias Model =
  { hover : List Int
  , group : String
  , toggleGroupByTab : Bool
  , toggleCardLayout : Bool
  , toggleSidebar : Bool
  , toggleAction : Bool
  }


model : Model
model =
  { hover = []
  , group = "蔬菜"
  , toggleGroupByTab = True
  , toggleCardLayout = True
  , toggleSidebar = True
  , toggleAction  = False
  }


type Msg
  = Hover (List Int)
  | Group  String
  | ToggleGroupByTab
  | ToggleCardLayout
  | ToggleSidebar
  | ToggleAction


update : Msg -> Model -> Model
update actionMsg model =
  case actionMsg of
    Hover list -> { model | hover  = list }
    Group str  -> { model | group  = str }
    ToggleGroupByTab -> { model | toggleGroupByTab = (not model.toggleGroupByTab) }
    ToggleCardLayout -> { model | toggleCardLayout = (not model.toggleCardLayout) }
    ToggleSidebar -> { model | toggleSidebar = (not model.toggleSidebar) }
    ToggleAction  -> { model | toggleAction = (not model.toggleAction) }


resize : Screen.Msg -> Model -> Model
resize screenMsg model =
  case screenMsg of
    Width w ->
      { model
      | toggleCardLayout = w > 1120
      , toggleGroupByTab = w > 1120
      }

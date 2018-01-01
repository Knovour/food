module Architecture.Action exposing (..)

import Architecture.Screen as Screen exposing (..)
import Routing exposing (Route, getRouteTarget)



type alias Model =
  { hover : List Int
  , group : String
  , isCardLayout : Bool
  , toggleSidebar : Bool
  , toggleActionBtn : Bool
  }


model : Model
model =
  { hover = []
  , group = "vegetables"
  , isCardLayout = True
  , toggleSidebar = True
  , toggleActionBtn = False
  }


type Msg
  = Hover (List Int)
  | Group String
  | IsCardLayout
  | ToggleSidebar
  | ToggleActionBtn


update : Msg -> Model -> Model
update actionMsg model =
  case actionMsg of
    Hover list      -> { model | hover = list }
    Group str       -> { model | group = str }
    IsCardLayout    -> { model | isCardLayout = (not model.isCardLayout) }
    ToggleSidebar   -> { model | toggleSidebar = (not model.toggleSidebar) }
    ToggleActionBtn -> { model | toggleActionBtn = (not model.toggleActionBtn) }


resize : Screen.Msg -> Model -> Model
resize screenMsg model =
  case screenMsg of
    Width w ->
      { model
      | isCardLayout = (w <= 1120 || model.isCardLayout)
      }


updateGroup : Route -> Model -> Model
updateGroup routeMsg model =
  { model | group = getRouteTarget routeMsg }

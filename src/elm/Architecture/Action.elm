module Architecture.Action exposing (Model, Msg(..), model, resize, update, updateGroup)

import Architecture.Screen as Screen exposing (..)
import Route exposing (Route, getRouteTarget)


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
update actionMsg actionModel =
  case actionMsg of
    Hover list -> { actionModel | hover = list }
    Group str -> { actionModel | group = str }
    IsCardLayout -> { actionModel | isCardLayout = not actionModel.isCardLayout }
    ToggleSidebar -> { actionModel | toggleSidebar = not actionModel.toggleSidebar }
    ToggleActionBtn -> { actionModel | toggleActionBtn = not actionModel.toggleActionBtn }


resize : Screen.Msg -> Model -> Model
resize screenMsg actionModel =
  case screenMsg of
    Width w -> { actionModel | isCardLayout = w <= 1120 || model.isCardLayout }


updateGroup : Route -> Model -> Model
updateGroup routeMsg actionModel =
  { actionModel | group = getRouteTarget routeMsg }

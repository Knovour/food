module Architecture.Action exposing (..)

import Architecture.Screen as Screen exposing (..)
import Routing exposing (..)



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
  , group = "蔬菜"
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


updateGroup : Routing.Route -> Model -> Model
updateGroup routeMsg model =
  case routeMsg of
    VegetableRoute -> { model | group = "蔬菜" }
    RootVegetableRoute -> { model | group = "根莖類" }
    BeanRoute -> { model | group = "豆類" }
    MushroomRoute -> { model | group = "菇類" }
    CerealRoute -> { model | group = "穀類" }
    FruitRoute -> { model | group = "水果" }
    NotFoundRoute -> model

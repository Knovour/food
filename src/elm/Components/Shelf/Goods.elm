module Components.Shelf.Goods exposing (..)
import Html            exposing (Html, Attribute, div)
import Html.Attributes exposing (classList)

import Components.Shelf.Food  exposing (food)
import Architecture.Main   as Main exposing (..)
import Architecture.Action as Action exposing (..)
import Libs.Type exposing (Food)



goods : Action.Model -> List (Html msg) -> Html msg
goods { isCardLayout } slot = div
    [ classList
      [ ("goods-layout", True)
      , ("-card", isCardLayout)
      , ("-list", not isCardLayout)
      ]
    ] slot


foodList : List Food -> Main.Model -> List (Html Main.Msg)
foodList list model = List.map (food model) list

module Components.Shelf.Goods exposing (foodList, goods)

import Html exposing (Html, div)
import Html.Attributes exposing (classList)

import Architecture.Action as Action exposing (..)
import Architecture.Main as Main exposing (..)
import Components.Shelf.Food exposing (food)
import Libs.Type exposing (Food)


goods : Action.Model -> List (Html msg) -> Html msg
goods { isCardLayout } slot =
  div
    [ classList
      [ ("goods-layout", True)
      , ("-card", isCardLayout)
      , ("-list", not isCardLayout)
      ]
    ]
    slot


foodList : List Food -> Main.Model -> List (Html Main.Msg)
foodList list model = List.map (food model) list

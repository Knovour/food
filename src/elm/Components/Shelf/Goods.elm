module Components.Shelf.Goods exposing (..)
import Html            exposing (Html, Attribute, div)
import Html.Attributes exposing (class)

import Components.Shelf.Food  exposing (food)
import Architecture.Main   as Main exposing (..)
import Architecture.Action as Action exposing (..)
import Libs.Type exposing (Food)



goods : List (Attribute msg) -> List (Html msg) -> Html msg
goods attr slot = div [ class "goods" ] slot


foodList : List Food -> Action.Model -> List (Html Main.Msg)
foodList list action = List.map (\foodData -> food foodData action) list

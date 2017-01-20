module Components.Shelf.Food exposing (..)

import Html exposing (Html, div, span, img, text, i, a)
import Html.Attributes exposing (..)
import Html.Events as Event exposing (onMouseEnter, onMouseLeave)
import String exposing (isEmpty, contains)

import Libs.Type exposing (Food)
import Libs.Helper exposing (include)

import Msg.Action exposing (..)
import Msg.Main as Main exposing (..)
import Model.Search as Search



food : Food -> Html Main.Msg
food food =
  let
    harvest = List.map (\month ->
      let
        classes =
          if (food.harvest |> include month) then
            "dot current"
          else
            "dot"
      in
        div [ class classes ] []
    ) (List.range 1 12)
  in
    div [ class "food-card", onMouseEnter (ActionMsg <| Hover food.harvest), onMouseLeave (ActionMsg <| Hover []) ]
      [ div [ class "media" ] [ img [ class "img", src food.image, alt "" ] [] ]
      , div [ class "info" ]
        [ div [ class "harvest-light" ] harvest
        , span [ class "name" ] [ text food.name ]
        , a [ class "copyright", href food.source, target "_blank" ] [ text "圖片來源" ]
        ]
      ]

isFilterHarvest : List Int -> List Int -> Bool
isFilterHarvest harvest selectedMonth =
  let
    result =
      if (List.length selectedMonth) > (List.length harvest) then
        -1
      else
        selectedMonth
          |> List.filter (\num -> harvest |> include num)
          |> List.length
  in
    (List.length selectedMonth) == result


list : List Food -> Search.Model -> List (Html Main.Msg)
list foodList { name, month } =
  List.map (\foodData ->
    let
      isSearchResult = isEmpty name || (name |> contains foodData.name)
      isFilterResult = List.isEmpty month || (isFilterHarvest foodData.harvest month)
    in
      if (isSearchResult && isFilterResult) then
        food foodData
      else
        text ""
  ) foodList

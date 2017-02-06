module Components.Tools.Month exposing (..)
import Html            exposing (Html, Attribute, div, p, i, text)
import Html.Attributes exposing (class)
import Html.Events     exposing (onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Search as Search exposing (..)
import Architecture.Action as Action



month : Action.Model -> Search.Model -> Html Main.Msg
month { sidebar, hover } { month } =
  let
    label =
      if sidebar == "open"
      then text "月份"
      else i [ class "material-icons icon" ] [ text "today" ]
    classes =
      if sidebar == "open"
      then ""
      else " -narrow"
  in
    div [ class ("options-block calendar-filter" ++ classes) ]
      [ p [ class "heading" ] [ label ]
      , div [ class "calendar" ] (monthCircle hover month)
      ]


monthCircle : List Int -> List Int -> List (Html Main.Msg)
monthCircle hover month =
  List.map (\num ->
    div
      [ classes (List.member num hover) (List.member num month)
      , onClick (handleClick num month)
      ] [ text (toString num) ]
  ) (List.range 1 12)


classes : Bool -> Bool -> Attribute Main.Msg
classes isHighlight isSelected =
  let highlight = if isHighlight then " _highlight" else ""
      selected = if isSelected then " _selected" else ""
  in class ("month" ++ highlight ++ selected)


handleClick : Int -> List Int -> Main.Msg
handleClick num list =
  if (List.member num list)
  then Search <| UnSelectMonth num
  else Search <| SelectMonth num

module Components.Tools.Month exposing (..)

import Html exposing (Html, Attribute, div, p, text)
import Html.Attributes exposing (class)
import Html.Events as Event exposing (onClick)

import Libs.Helper exposing (include)

import Msg.Main as Main exposing (..)
import Msg.Search exposing (..)

import Model.Action as Action exposing (..)
import Model.Search as Search exposing (..)

classes : Bool -> Bool -> Attribute Main.Msg
classes isHighlight isSelected =
  let
    highlight = if isHighlight then " _highlight" else ""
    selected = if isSelected then " _selected" else ""
  in
    class ("month" ++ highlight ++ selected)

current : Int -> Html Main.Msg
current num = text (toString num)

handleClick : Int -> List Int -> Main.Msg
handleClick num list =
  if (list |> include num) then
    SearchMsg <| UnSelectMonth num
  else
    SearchMsg <| SelectMonth num

month : Action.Model -> Search.Model -> Html Main.Msg
month { hover } { month } =
  let
    group =
      List.map (\num ->
        div
          [ classes (hover |> include num) (month |> include num)
          , onClick (handleClick num month)
          ] [ current num ]
      ) (List.range 1 12)
  in
    div [ class "options-block" ]
      [ p [ class "heading" ] [ text "月份" ]
      , div [ class "calendar" ] group
      ]

module Components.Tools.Month exposing (..)

import Html exposing (Html, Attribute, div, p, text)
import Html.Attributes exposing (class)

import Libs.Helper exposing (include)

import Msg.Main as Main exposing (..)

import Model.Action exposing (Model)

classes : Bool -> Attribute Main.Msg
classes isHighlight =
  if isHighlight then
    class "month _highlight"
  else
    class "month"

current : Int -> Html Main.Msg
current num = text (toString num)

month : Model -> Html Main.Msg
month { hover } =
  let
    group = List.map (\num -> div [ classes (hover |> include num) ] [ current num ]) (List.range 1 12)
  in
    div [ class "options-block" ]
      [ p [ class "heading" ] [ text "月份" ]
      , div [ class "calendar" ] group
      ]

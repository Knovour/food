module Components.Tools.Month exposing (..)
import Html            exposing (Html, Attribute, div, p, i, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Search as Search exposing (..)
import Architecture.Action as Action



month : Action.Model -> Search.Model -> Html Main.Msg
month { toggleSidebar, hover } { month } =
  let classes =
        classList
          [ ("options-block calendar-filter", True)
          , ("-narrow", not toggleSidebar)
          ]
      label =
        if toggleSidebar
        then text "月份"
        else i [ class "material-icons icon" ] [ text "today" ]
  in
    div [ classes ]
      [ p [ class "heading" ] [ label ]
      , div [ class "calendar" ] (monthCircle hover month)
      ]


monthCircle : List Int -> List Int -> List (Html Main.Msg)
monthCircle hover month =
  List.map (\num ->
    let isSelected = List.member num month
        classes =
          classList
            [ ("month -circle", True)
            , ("-highlight", List.member num hover)
            , ("-selected", isSelected)
            ]
        event =
          if isSelected
          then Search <| UnSelectMonth num
          else Search <| SelectMonth num
    in div [ classes, onClick event ] [ text (toString num) ]
  ) (List.range 1 12)

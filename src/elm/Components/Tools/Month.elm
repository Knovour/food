module Components.Tools.Month exposing (monthFilter, monthCircle)

import Architecture.Action as Action
import Architecture.Filter as Filter exposing (..)
import Architecture.Main as Main exposing (..)
import Elements.Icon exposing (icon)
import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)


monthFilter : Action.Model -> Filter.Model -> Html Main.Msg
monthFilter { toggleSidebar, hover } { month } =
    let label =
          if toggleSidebar
          then text "月份"
          else icon "today"
    in
      div
        [ classList
          [ ("options-block", True)
          , ("-narrow", not toggleSidebar)
          ]
        ]
        [ p [ class "heading" ] [ label ]
        , div [ class "calendar-filter" ] (monthCircle hover month)
        ]


monthCircle : List Int -> List Int -> List (Html Main.Msg)
monthCircle hover monthList =
  List.map
    (\num ->
      div
        [ classList
          [ ("month -circle", True)
          , ("-highlight", List.member num hover)
          , ("-selected", List.member num monthList)
          ]
        , onClick (Filter <| Month num)
        ]
        [ text (String.fromInt num) ]
    ) (List.range 1 12)

module Components.Tools.Month exposing (..)
import Html            exposing (Html, Attribute, div, p, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)

import Elements.Icon exposing (icon)
import Architecture.Main   as Main exposing (..)
import Architecture.Filter as Filter exposing (..)
import Architecture.Action as Action



month : Action.Model -> Filter.Model -> Html Main.Msg
month { toggleSidebar, hover } { month } =
  let label = if toggleSidebar then text "月份" else icon "today"
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
monthCircle hover month =
  List.map (\num ->
    div
      [ classList
        [ ("month -circle", True)
        , ("-highlight", List.member num hover)
        , ("-selected", List.member num month)
        ]
      , onClick (Filter <| Month num)
      ] [ text (toString num) ]
  ) (List.range 1 12)

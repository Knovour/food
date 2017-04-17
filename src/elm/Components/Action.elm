module Components.Action exposing (action)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)

import Elements.Icon exposing (icon)
import Architecture.Main as Main exposing (..)
import Architecture.Filter as Filter exposing (..)
import Architecture.Action as Action exposing (..)



action : Action.Model -> Filter.Model -> Html Main.Msg
action { toggleActionBtn } { month } =
  let actionIcon = if toggleActionBtn then "done" else "date_range"
  in
    div
      [ classList
        [ ("action-block", True)
        , ("-active", toggleActionBtn)
        ]
      ]
      [ div [ class "select" ] (monthList month)
      , div [ class "reset ctrl", onClick (Filter ClearMonth) ] [ icon "loop" ]
      , div [ class "action ctrl", onClick (Action ToggleActionBtn) ] [ icon actionIcon ]
      ]


monthList : List Int -> List (Html Main.Msg)
monthList month =
  List.map (\num ->
    div
      [ classList
        [ ("month", True)
        , ("-selected", List.member num month)
        ]
      , onClick (Filter <| Month num)
      ] [ text (toString num) ]
  ) (List.range 1 12)

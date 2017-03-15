module Components.Action exposing (action)
import Html exposing (Html, div, i, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Search exposing (..)
import Architecture.Action exposing (..)


action : Main.Model -> Html Main.Msg
action { action, search } =
  let
    classes =
      classList
        [ ("action-block", True)
        , ("_active", action.toggleAction)
        ]
    icon = if action.toggleAction then "done" else "date_range"
  in
    div [ classes ]
      [ div [ class "select" ] (monthList search.month)
      , div [ class "reset ctrl", onClick (Search <| ClearMonth) ] [ i [ class "icon material-icons" ] [ text "loop" ] ]
      , div [ class "action ctrl", onClick (Action <| ToggleAction) ] [ i [ class "icon material-icons" ] [ text icon ] ]
      ]

monthList : List Int -> List (Html Main.Msg)
monthList month =
  List.map (\num ->
    div
      [ classList
        [ ("month", True)
        , ("_selected", List.member num month)
        ]
        , onClick (handleClick num month)
      ] [ text (toString num) ]
  ) (List.range 1 12)


handleClick : Int -> List Int -> Main.Msg
handleClick num list =
  if (List.member num list)
  then Search <| UnSelectMonth num
  else Search <| SelectMonth num

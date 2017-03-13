module Components.Action exposing (action)
import Html exposing (Html, div, i, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Action exposing (..)


action : Main.Model -> Html Main.Msg
action { action } =
  let
    click =
      if action.toggleAction
      then (Action <| ToggleAction False)
      else (Action <| ToggleAction True)
    classes =
      classList
        [ ("action-block", True)
        , ("_active", action.toggleAction)
        ]
    icon =
      if action.toggleAction
      then "done"
      else "date_range"
  in
    div [ classes ]
      [ div [ class "select" ]
        [ div [ class "month" ] [ text "1" ]
        , div [ class "month" ] [ text "2" ]
        , div [ class "month" ] [ text "3" ]
        , div [ class "month" ] [ text "4" ]
        , div [ class "month" ] [ text "5" ]
        , div [ class "month" ] [ text "6" ]
        , div [ class "month" ] [ text "7" ]
        , div [ class "month" ] [ text "8" ]
        , div [ class "month" ] [ text "9" ]
        , div [ class "month" ] [ text "10" ]
        , div [ class "month" ] [ text "11" ]
        , div [ class "month" ] [ text "12" ]
        ]
      , div [ class "reset ctrl" ] [ i [ class "icon material-icons" ] [ text "loop" ] ]
      , div [ class "action ctrl", onClick click ] [ i [ class "icon material-icons" ] [ text icon ] ]
      ]

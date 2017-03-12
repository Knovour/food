module Components.Action exposing (action)
import Html exposing (Html, div, i, text)
import Html.Attributes exposing (class)

import Architecture.Main   as Main exposing (..)



action : Html Main.Msg
action =
  div [ class "action-button" ] [ i [ class "icon material-icons" ] [ text "date_range" ] ]

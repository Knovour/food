module Components.Dimmer exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events as Event exposing (onClick)
import Msg.Main as Main exposing (..)
import Msg.Box exposing (..)

render : Bool -> Html Main.Msg
render toggleDimmer =
  if toggleDimmer then
    div [ class "dimmer", onClick (BoxMsg <| Close) ] []
  else
   text ""

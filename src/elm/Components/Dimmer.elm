module Components.Dimmer exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events as Event exposing (onClick)
import Msg.Main as Main exposing (..)
import Msg.Box exposing (..)


render : Bool -> Html Main.Msg
render showDimmer =
  let
    toggle =
      if showDimmer then
        "_show"
      else
        "_hide"

    classes = "dimmer " ++ toggle
  in
    div [ class classes, onClick (BoxMsg <| Close) ] []

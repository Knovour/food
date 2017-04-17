module Components.Dimmer exposing (..)
import Html            exposing (Html, div)
import Html.Attributes exposing (classList)
import Html.Events     exposing (onClick)

import Architecture.Main as Main exposing (..)
import Architecture.Box  as Box exposing (..)



dimmer : Box.Model -> Html Main.Msg
dimmer { open } =
  div
    [ classList
      [ ("dimmer", True)
      , ("-disabled", not open)
      ]
    , onClick (Box Close)
    ] []

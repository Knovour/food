module Components.Dimmer exposing (dimmer)

import Html exposing (Html, div)
import Html.Attributes exposing (classList)
import Html.Events exposing (onClick)

import Architecture.Box as Box exposing (..)
import Architecture.Main as Main exposing (..)

dimmer : Box.Model -> Html Main.Msg
dimmer { open } =
  div
    [ classList
      [ ("dimmer", True)
      , ("-disabled", not open)
      ]
    , onClick (Box Close)
    ]
    []

module Components.Dimmer exposing (..)
import Html            exposing (Html, div, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)

import Architecture.Main as Main exposing (..)
import Architecture.Box  as Box exposing (..)



dimmer : Box.Model -> Html Main.Msg
dimmer { open } =
  let classes =
        classList
          [ ("dimmer", True)
          , ("_hide", not open)
          ]
      handleClick =
        if open
        then Box <| Close
        else NoOp
  in div [ classes, onClick handleClick ] []

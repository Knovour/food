module Components.Dimmer exposing (..)
import Html            exposing (Html, div, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)

import Architecture.Main as Main exposing (..)
import Architecture.Box  exposing (..)



dimmer : Main.Model -> Html Main.Msg
dimmer { box, action, screen } =
  let classes =
        classList
          [ ("dimmer", True)
          , ("_show", box.open)
          , ("_hide", not box.open)
          ]
      handleClick =
        if box.open
        then Box <| Close
        else NoOp
  in div [ classes, onClick handleClick ] []

module Components.Dimmer exposing (..)
import Html            exposing (Html, div, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Box    exposing (..)
import Architecture.Action exposing (..)



dimmer : Main.Model -> Html Main.Msg
dimmer { box, action, screen } =
  let isBoxShow = (box.open || (action.toggleSidebar && screen.width <= 976))
      classes =
        classList
          [ ("dimmer", True)
          , ("_show", isBoxShow)
          , ("_hide", not isBoxShow)
          ]
      handleClick =
        if box.open
        then Box <| Close
        else if (action.toggleSidebar && screen.width <= 976)
        then Action <| ToggleSidebar
        else NoOp
  in div [ classes, onClick handleClick ] []

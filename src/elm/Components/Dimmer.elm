module Components.Dimmer exposing (..)
import Html            exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events     exposing (onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Box    exposing (..)
import Architecture.Action exposing (..)



dimmer : Main.Model -> Html Main.Msg
dimmer { box, action, screen } =
  let
    classes =
      if (box.open || (action.sidebar == "open" && screen.width <= 976))
      then "dimmer _show"
      else "dimmer _hide"
    handleClick =
      if box.open
      then Box <| Close
      else if (action.sidebar == "open" && screen.width <= 976)
      then Action <| Sidebar "close"
      else NoOp
  in
    div [ class classes, onClick handleClick ] []

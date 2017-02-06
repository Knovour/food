module Components.Tools exposing (..)
import Html            exposing (Html, div, i, text)
import Html.Attributes exposing (class)

import Architecture.Main   as Main exposing (..)
import Components.Tools.Display exposing (display)
import Components.Tools.Month   exposing (month)
import Components.Footer exposing (footer_)



tools : Main.Model -> Html Main.Msg
tools { action, search, screen } =
  let
    classes =
      if action.sidebar == "open"
      then ""
      else " -narrow"
  in
    div [ class ("tools-sidebar" ++ classes) ]
      [ display action
      , month action search
      , footer_
      ]

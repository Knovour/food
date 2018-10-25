module Components.Tools exposing (tools)

import Html exposing (Html, div)
import Html.Attributes exposing (classList)

import Architecture.Main as Main exposing (..)
import Components.Footer exposing (footer_)
import Components.Tools.Display exposing (display)
import Components.Tools.Month exposing (monthFilter)

tools : Main.Model -> Html Main.Msg
tools { action, filter } =
  div
    [ classList
      [ ("tools-sidebar", True)
      , ("-narrow", not action.toggleSidebar)
      ]
    ]
    [ display action
    , monthFilter action filter
    , footer_
    ]

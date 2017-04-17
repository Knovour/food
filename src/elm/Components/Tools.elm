module Components.Tools exposing (..)
import Html            exposing (Html, div)
import Html.Attributes exposing (classList)

import Architecture.Main as Main exposing (..)
import Components.Tools.Display exposing (display)
import Components.Tools.Month   exposing (month)
import Components.Footer        exposing (footer_)



tools : Main.Model -> Html Main.Msg
tools { action, filter } =
  div
    [ classList
      [ ("tools-sidebar", True)
      , ("-narrow", not action.toggleSidebar)
      ]
    ]
    [ display action
    , month action filter
    , footer_
    ]

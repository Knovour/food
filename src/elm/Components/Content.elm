module Components.Content exposing (..)
import Html            exposing (Html, div)
import Html.Attributes exposing (id, class, classList)
import Dict exposing (Dict)

import Architecture.Main as Main exposing (..)
import Components.Shelf exposing (shelf)
import Libs.Type    exposing (Food)



content : Model -> Dict String (List Food) -> Html Main.Msg
content { action, screen } foodDict =
  div
    [ id "content"
    , classList
      [ ("-show-all", not action.toggleGroupByTab)
      , ("-center", (not action.toggleSidebar || screen.width <= 976))
      ]
    ] [ shelf action foodDict ]

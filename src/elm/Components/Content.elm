module Components.Content exposing (content)

import Dict exposing (Dict)
import Html exposing (Html, div)
import Html.Attributes exposing (class, classList, id)
import Libs.Type exposing (Food)

import Architecture.Main as Main exposing (..)
import Components.Shelf exposing (shelf)


content : Model -> Dict String (List Food) -> Html Main.Msg
content model foodDict =
  let { action, screen } = model
  in
    div
      [ id "content"
      , classList
        [ ("-center", not action.toggleSidebar || screen.width <= 976)
        ]
      ]
      [ shelf model foodDict ]

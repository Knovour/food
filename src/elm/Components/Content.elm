module Components.Content exposing (..)
import Html            exposing (Html, div)
import Html.Attributes exposing (id, class, classList)
import Dict exposing (Dict)

import Architecture.Main as Main exposing (..)
import Components.Shelf exposing (shelf)
import Libs.Type    exposing (Food)



content : Model -> Dict String (List Food) -> Html Main.Msg
content model foodDict =
  let { action, screen } = model
      classes =
        classList
          [ ("_show-all", not action.toggleGroupByTab)
          , ("_center", (not action.toggleSidebar || screen.width <= 976))
          ]
  in div [ id "content", classes ] [ shelf action foodDict ]

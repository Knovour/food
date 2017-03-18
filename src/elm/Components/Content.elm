module Components.Content exposing (..)
import Html            exposing (Html, div)
import Html.Attributes exposing (id, class, classList)

import Architecture.Main as Main exposing (..)
import Components.Tabs  exposing (tabs)
import Components.Shelf exposing (shelf)
import Libs.Helpers exposing (foodRefilter)



content : Model -> Html Main.Msg
content model =
  let { action, search, content, screen } = model
      foodDict = foodRefilter action search content
      classes =
        classList
          [ ("_show-all", not action.toggleGroupByTab)
          , ("_center", (not action.toggleSidebar || screen.width <= 976))
          ]
  in
    div []
      [ tabs action foodDict
      , div [ id "content", classes ] [ shelf model foodDict ]
      ]

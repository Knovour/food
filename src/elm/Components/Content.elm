module Components.Content exposing (..)
import Html            exposing (Html, div)
import Html.Attributes exposing (id, class, classList)
import Dict exposing (Dict)

import Architecture.Main as Main exposing (..)
import Components.Tabs  exposing (tabs)
import Components.Shelf exposing (shelf)
import Components.Table exposing (table_)
import Libs.Type    exposing (Food)
import Libs.Helpers exposing (foodRefilter, getDictValue)



content : Model -> Html Main.Msg
content model =
  let { action, search, content, screen } = model
      foodDict = foodRefilter action search content
      classes =
        classList
          [ ("_show-all", action.showBy == "標籤")
          , ("_center", (not action.toggleSidebar || screen.width <= 976))
          ]
  in
    div []
      [ tabs action foodDict
      , div [ id "content", classes ] [ display model foodDict ]
      ]


display : Main.Model -> Dict String (List Food) -> Html Main.Msg
display model foodDict =
  if model.action.layout == "apps"
  then shelf model foodDict
  else table_ model foodDict

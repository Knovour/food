module Components.Content exposing (..)
import Html            exposing (Html, div)
import Html.Attributes exposing (id, class)
import Dict exposing (Dict)

import Architecture.Main as Main exposing (..)
import Components.Tabs  exposing (tabs)
import Components.Shelf exposing (shelf)
import Components.Table exposing (table_)
import Libs.Type    exposing (Food)
import Libs.Helpers exposing (foodRefilter, getDictValue)



content : Model -> Html Main.Msg
content model =
  let foodDict = foodRefilter model.action model.search model.content
      toggle =
        if model.action.showBy == "標籤"
        then "_show-all"
        else ""
  in
    div []
      [ tabs model.action foodDict
      , div [ id "content", class toggle ] [ display model foodDict ]
      ]


display : Main.Model -> Dict String (List Food) -> Html Main.Msg
display model foodDict =
  if model.action.layout == "apps"
  then shelf model foodDict
  else table_ model foodDict

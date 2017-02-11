module Components.Shelf exposing (layer_, shelf)
import Html            exposing (Html, div, text)
import Html.Attributes exposing (class, classList, attribute)
import Dict exposing (Dict)

import Architecture.Main   as Main exposing (..)
import Architecture.Action as Action
import Components.Shelf.Layer as Layer exposing (layer)
import Components.Shelf.Goods exposing (goods)
import Components.Shelf.Food  as Food
import Components.Tag as Tag exposing (tag)
import Libs.Data    exposing (foodTypes)
import Libs.Type    exposing (Food)
import Libs.Helpers exposing (foodRefilter, getDictValue)



shelf : Model -> Dict String (List Food) -> Html Main.Msg
shelf { search, box, action, content } foodDict =
  div
    [ classList
      [ ("food-shelf", True)
      , ("_show-all", action.showBy == "標籤")
      ]
    ] (layer_ action foodDict)


layer_ : Action.Model -> Dict String (List Food) -> List (Html Main.Msg)
layer_ action foodDict =
  List.map(\species ->
    let list = getDictValue species foodDict
        isCurrentLayer = List.length list > 0 && (action.showBy /= "分頁" || species == action.group)
    in
      layer [ Layer.show isCurrentLayer, attribute "data-type" species ]
        [ tag [ Tag.show action.showBy ] [ text species ]
        , goods [] (Food.list list)
        ]
  ) foodTypes

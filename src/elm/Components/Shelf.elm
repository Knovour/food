module Components.Shelf exposing (layer_, shelf)
import Html            exposing (Html, div, text)
import Html.Attributes exposing (class)
import Dict exposing (Dict)

import Architecture.Main   as Main exposing (..)
import Architecture.Action as Action
import Components.Shelf.Layer as Layer exposing (layer)
import Components.Shelf.Goods as Goods exposing (goods)
import Components.Tag as Tag exposing (tag)
import Libs.Data    exposing (foodTypes)
import Libs.Type    exposing (Food)
import Libs.Helpers exposing (foodRefilter, getDictValue)



shelf : Action.Model -> Dict String (List Food) -> Html Main.Msg
shelf action foodDict =
  div [ class "food-shelf" ] (layer_ action foodDict)


layer_ : Action.Model -> Dict String (List Food) -> List (Html Main.Msg)
layer_ action foodDict =
  List.map(\species ->
    let list = getDictValue species foodDict
        isCurrentLayer = List.length list > 0 && (not action.isGroupByTab || species == action.group)
    in
      layer [ Layer.display isCurrentLayer, Layer.dataType species ]
        [ tag [ Tag.show action.isGroupByTab ] [ text species ]
        , goods [] (Goods.foodList list action)
        ]
  ) foodTypes

module Components.Shelf exposing (layer_, shelf)
import Html            exposing (Html, div, text)
import Html.Attributes exposing (class)
import Dict exposing (Dict)

import Architecture.Main as Main exposing (..)
import Components.Shelf.Layer as Layer exposing (layer)
import Components.Shelf.Goods as Goods exposing (goods)
import Components.Tag as Tag exposing (tag)
import Libs.Data    exposing (foodTypes)
import Libs.Type    exposing (Food)
import Libs.Helpers exposing (foodRefilter, getDictValue)



shelf : Model -> Dict String (List Food) -> Html Main.Msg
shelf model foodDict =
  div [ class "food-shelf" ] (layer_ model foodDict)


layer_ : Model -> Dict String (List Food) -> List (Html Main.Msg)
layer_ model foodDict =
  let { action } = model
  in
    List.filterMap (\species ->
      let list = getDictValue species foodDict
          isCurrentLayer = List.length list > 0 && (not action.isGroupByTab || species == action.group)
      in
        case isCurrentLayer of
          False -> Nothing
          True ->
            Just
              (layer [ Layer.dataType species ]
                [ tag action.isGroupByTab species
                , goods action (Goods.foodList list model)
                ])
    ) foodTypes

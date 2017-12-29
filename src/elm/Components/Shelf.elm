module Components.Shelf exposing (layer_, shelf)
import Html            exposing (Html, div, text)
import Html.Attributes exposing (class)
import Dict exposing (Dict)

import Architecture.Main as Main exposing (..)
import Components.Shelf.Layer as Layer exposing (layer)
import Components.Shelf.Goods as Goods exposing (goods)
import Libs.Data    exposing (foodTypes)
import Libs.Type    exposing (Food, FoodType)
import Libs.Helpers exposing (foodRefilter, getDictValue)



shelf : Model -> Dict String (List Food) -> Html Main.Msg
shelf model foodDict =
  div [ class "food-shelf" ] (layer_ model foodDict)


layer_ : Model -> Dict String (List Food) -> List (Html Main.Msg)
layer_ model foodDict =
  let { action } = model
  in
    List.filterMap (\{ name } ->
      let list = getDictValue name foodDict
          isCurrentLayer = List.length list > 0 && name == action.group
      in
        case isCurrentLayer of
          False -> Nothing
          True ->
            Just
              (layer [ Layer.dataType name ]
                [ goods action (Goods.foodList list model)
                ]
              )
    ) foodTypes

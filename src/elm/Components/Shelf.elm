module Components.Shelf exposing (layer_, shelf)

import Dict exposing (Dict)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)

import Architecture.Main as Main exposing (..)
import Components.Shelf.Goods as Goods exposing (goods)
import Components.Shelf.Layer as Layer exposing (layer)
import Libs.Data exposing (foodTypes)
import Libs.Helpers exposing (foodRefilter, getDictValue)
import Libs.Type exposing (Food, FoodType)


shelf : Model -> Dict String (List Food) -> Html Main.Msg
shelf model foodDict = div [ class "food-shelf" ] (layer_ model foodDict)


layer_ : Model -> Dict String (List Food) -> List (Html Main.Msg)
layer_ model foodDict =
    let { action } = model
    in
      List.filterMap
        (\{ enName } ->
          let list = getDictValue enName foodDict
              isCurrentLayer = List.length list > 0 && enName == action.group
          in
            case isCurrentLayer of
              False -> Nothing
              True ->
                Just
                  (layer [ Layer.dataType enName ]
                    [ goods action (Goods.foodList list model) ]
                  )
        ) foodTypes

module Components.Shelf exposing (goods, render)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components.Layer as Layer
import Components.Goods as Goods
import Components.Food as Food
import Msg.Main as Main exposing (..)
import Libs.Type exposing (Food)
import Model.Month as Month


goods : List { currentType : String, list : List Food } -> Month.Model -> List (Html Main.Msg)
goods goods monthModel =
  List.map
    (\{ currentType, list } ->
      Layer.render { species = currentType }
        [ Layer.label currentType
        , Goods.render (Food.render list monthModel.current)
        ]
    )
    goods


render : List a -> List (Html Main.Msg) -> Html Main.Msg
render attr elemList =
  div [ class "food-shelf" ] elemList

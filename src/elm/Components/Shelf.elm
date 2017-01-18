module Components.Shelf exposing (goods, render)

import Html exposing (..)
import Html.Attributes exposing (..)
import Components.Layer as Layer
import Components.Goods as Goods
import Components.Food as Food
import Msg.Main as Main exposing (..)
import Libs.Type exposing (Group, Food)
import Model.Search as Search
import Model.Action as Action


goods : Action.Model -> List Group -> Search.Model -> List (Html Main.Msg)
goods actions goods searchModel =
  List.map (\{ tag, list } ->
    if tag == actions.tag then
      Layer.render tag
      [ Layer.label tag
      , Goods.render (Food.render list searchModel)
      ]
    else
      text ""
  ) goods


render : List a -> List (Html Main.Msg) -> Html Main.Msg
render attr elemList =
  div [ class "food-shelf" ] elemList

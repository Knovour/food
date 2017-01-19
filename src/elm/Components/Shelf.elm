module Components.Shelf exposing (layer_, shelf)

import Html exposing (Html, div)
import Html.Attributes exposing (class)

import Components.Shelf.Layer as Layer exposing (layer)
import Components.Shelf.Goods as Goods exposing (goods)
import Components.Shelf.Food as Food

import Msg.Main as Main exposing (..)

import Model.Search as Search
import Model.Action as Action

import Libs.Type exposing (Group)


layer_ : Action.Model -> List Group -> Search.Model -> List (Html Main.Msg)
layer_ actions foodList searchModel =
  List.map (\{ tag, list } ->
    layer [ Layer.show (tag == actions.tag), Layer.dataType tag ]
      [ Layer.name tag
      , goods [] (Food.list list searchModel)
      ]
  ) foodList


shelf : List a -> List (Html Main.Msg) -> Html Main.Msg
shelf attr slot =
  div [ class "food-shelf" ] slot

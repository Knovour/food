module Components.Shelf exposing (layer_, shelf)
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Dict exposing (Dict)

import Components.Shelf.Layer as Layer exposing (layer)
import Components.Shelf.Goods exposing (goods)
import Components.Shelf.Food  as Food
import Msg.Main as Main exposing (..)
import Model.Main   exposing (Model, model)
import Model.Action as Action
import Libs.Data    exposing (foodTypes)
import Libs.Type    exposing (Food)
import Libs.Helpers exposing (foodRefilter, getDictValue)



shelf : Model -> Dict String (List Food) -> Html Main.Msg
shelf { search, box, action, content } foodDict =
  let
    toggle = if action.tag == "標籤" then " -show-all" else ""
  in
    div [ class ("food-shelf" ++ toggle) ] (layer_ action foodDict)


layer_ : Action.Model -> Dict String (List Food) -> List (Html Main.Msg)
layer_ action foodDict =
  List.map(\species ->
    let
      list = getDictValue species foodDict
    in
      layer [ Layer.show (action.tag /= "分頁" || species == action.group), Layer.dataType species ]
        [ Layer.name [ Layer.labelView action.tag ] [ text species ]
        , goods [] (Food.list list)
        ]
    ) foodTypes

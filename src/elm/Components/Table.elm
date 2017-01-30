module Components.Table exposing (..)
import Html exposing (Html, div, table, thead, tr, th, tbody, td, span, text, img)
import Html.Attributes exposing (class, src, alt)
import Html.Events as Event exposing (onMouseEnter, onMouseLeave)
import Dict exposing (Dict)

import Components.Shelf.Layer as Layer
import Msg.Main   as Main exposing (..)
import Msg.Action exposing (..)
import Model.Main   exposing (Model, model)
import Model.Action as Action
import Libs.Data    exposing (foodTypes)
import Libs.Type    exposing (Food)
import Libs.Helpers exposing (foodRefilter, getDictValue)



table_ : Model -> Dict String (List Food) -> Html Main.Msg
table_ { search, box, action, content } foodDict =
  let toggle = if action.tag == "標籤" then " _show-all" else ""
  in  div [ class ("food-list" ++ toggle) ] (tableList action foodDict)


tableList : Action.Model -> Dict String (List Food) -> List (Html Main.Msg)
tableList { tag, group } foodDict =
  List.map(\species ->
    let list = getDictValue species foodDict
        toggle = if (tag /= "分頁" || species == group) then "" else " _hide"
    in
      div [ class ("food-table" ++ toggle) ]
        [ Layer.name [ Layer.labelView tag ] [ text species ]
        , div [ class "table-content" ] [ table [ class (classes tag species group) ] [ thead_ , tbody_ list ] ]
        ]
  ) foodTypes


classes : String -> String -> String -> String
classes tag species current = if (tag /= "分頁" || species == current) then "" else " _hide"


thead_ : Html Main.Msg
thead_ =
  let titles = [ "名稱", "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ]
      thList = List.map (\name -> th [] [ text name ]) titles
  in  thead [] [ tr [ class "table-head" ] thList ]


tbody_ : List Food -> Html Main.Msg
tbody_ list =
  let tdList =
        List.map (\food ->
          let harvest =
                List.map (\month ->
                  let dot = if (List.member month food.harvest) then " current" else ""
                  in  td [] [ span [ class ("dot -large" ++ dot) ] [] ]
                ) (List.range 1 12)
              hover = (ActionMsg <| Hover food.harvest)
              unHover =  (ActionMsg <| Hover [])
          in tr [ class "row", onMouseEnter hover, onMouseLeave unHover ] (td [] [ text food.name ] :: harvest)
        ) list
  in tbody [ class "table-body" ] ((tr [class "row _extra-spacing" ] [ td [] [] ]) :: tdList)

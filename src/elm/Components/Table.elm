module Components.Table exposing (..)
import Html exposing (Html, div, table, thead, tr, th, tbody, td, span, text, img)
import Html.Attributes exposing (class, src, alt)
import Dict exposing (Dict)

import Msg.Main as Main exposing (..)
import Model.Main   exposing (Model, model)
import Libs.Data    exposing (foodTypes)
import Libs.Type    exposing (Food)
import Libs.Helpers exposing (foodRefilter, getDictValue)



table_ : Model -> Dict String (List Food) -> Html Main.Msg
table_ { search, box, action, content } foodDict =
  let
    toggle = if action.tag == "標籤" then " -show-all" else ""
    tableList = List.map(\species ->
      let
        list = getDictValue species foodDict
        tdList =
          List.map (\food ->
            let
              harvest = List.map (\month ->
                let
                  classes = if (List.member month food.harvest) then " current" else ""
                in
                  td [] [ span [ class ("dot -large" ++ classes) ] [] ]
              ) (List.range 1 12)
            in
              tr [ class "row" ] (td [] [ text food.name ] :: harvest)
          ) list
      in
        table [ class (classes action.tag species action.group) ]
          [ thead [] [ tr [ class "table-head" ] thList ]
          , tbody [ class "table-body" ] tdList
          ]
      ) foodTypes
  in
    div [ class ("food-list" ++ toggle) ] tableList


classes : String -> String -> String -> String
classes tag species current = if (tag /= "分頁" || species == current) then "" else "_hide"


thList : List (Html Main.Msg)
thList =
  List.map (\name ->
    th [] [ text name ]
  ) [ "名稱", "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ]

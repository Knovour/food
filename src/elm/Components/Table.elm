module Components.Table exposing (..)
import Html            exposing (Html, div, table, thead, tr, th, tbody, td, span, text, img)
import Html.Attributes exposing (class, src, alt)
import Html.Events     exposing (onMouseEnter, onMouseLeave)
import Dict exposing (Dict)

import Architecture.Main   as Main   exposing (..)
import Architecture.Action as Action exposing (..)
import Components.Tag as Tag exposing (tag)
import Libs.Data    exposing (foodTypes)
import Libs.Type    exposing (Food)
import Libs.Helpers exposing (foodRefilter, getDictValue)



table_ : Main.Model -> Dict String (List Food) -> Html Main.Msg
table_ { search, box, action, content } foodDict =
  let toggle =
        if action.showBy == "標籤"
        then " _show-all"
        else ""
  in div [ class ("food-list" ++ toggle) ] (tableList action foodDict)


tableList : Action.Model -> Dict String (List Food) -> List (Html Main.Msg)
tableList { showBy, group } foodDict =
  List.map(\species ->
    let list = getDictValue species foodDict
        toggle =
          if List.length list > 0 && (showBy /= "分頁" || species == group)
          then ""
          else " _hide"
    in
      div [ class ("food-table" ++ toggle) ]
        [ tag [ Tag.show showBy ] [ text species ]
        , div [ class "table-content" ] [ table [ class (classes showBy species group) ] [ thead_ , tbody_ list ] ]
        ]
  ) foodTypes


classes : String -> String -> String -> String
classes tag species current =
  if (tag /= "分頁" || species == current)
  then ""
  else " _hide"


thead_ : Html Main.Msg
thead_ =
  let titles = [ "名稱", "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ]
      thList = List.map (\name -> th [] [ text name ]) titles
  in thead [] [ tr [ class "table-head" ] thList ]


tbody_ : List Food -> Html Main.Msg
tbody_ list =
  let tdList =
        List.map (\food ->
          let harvest =
                List.map (\month ->
                  let dot = if (List.member month food.harvest) then " current" else ""
                  in td [] [ span [ class ("dot -large" ++ dot) ] [] ]
                ) (List.range 1 12)
              hover = ActionMsg <| Hover food.harvest
              unHover = ActionMsg <| Hover []
          in tr [ class "row", onMouseEnter hover, onMouseLeave unHover ] (td [] [ text food.name ] :: harvest)
        ) list
  in tbody [ class "table-body" ] ((tr [class "row _extra-spacing" ] [ td [] [] ]) :: tdList)

module Components.Table exposing (..)
import Html            exposing (Html, div, table, thead, tr, th, tbody, td, span, text, img)
import Html.Attributes exposing (class, classList, src, alt)
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
  let classes =
        classList
          [ ("food-list", True)
          , ("_show-all", action.showBy == "標籤")
          ]
  in div [ classes ] (tableList action foodDict)


tableList : Action.Model -> Dict String (List Food) -> List (Html Main.Msg)
tableList { showBy, group } foodDict =
  List.map(\species ->
    let list = getDictValue species foodDict
        notCurrentContent = (showBy == "分頁" && species /= group)
        classes =
          classList
            [ ("food-table", True)
            , ("_hide", (List.length list == 0 || notCurrentContent))
            ]
        contentClasses = classList [ ("_hide", notCurrentContent) ]
    in
      div [ classes ]
        [ tag [ Tag.show showBy ] [ text species ]
        , div [ class "table-content" ] [ table [ contentClasses ] [ thead_ , tbody_ list ] ]
        ]
  ) foodTypes


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
                  td []
                    [ span
                      [ classList
                        [ ("dot", True)
                        , ("-large", True)
                        , ("current", (List.member month food.harvest))
                        ]
                      ] []
                    ]
                ) (List.range 1 12)
              hover = Action <| Hover food.harvest
              unHover = Action <| Hover []
          in tr [ class "row", onMouseEnter hover, onMouseLeave unHover ] (td [] [ text food.name ] :: harvest)
        ) list
  in tbody [ class "table-body" ] ((tr [class "row _extra-spacing" ] [ td [] [] ]) :: tdList)

module Components.Tabs exposing (tabs)
import Html            exposing (Html, Attribute, div, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)
import Dict exposing (Dict)

import Architecture.Main   as Main   exposing (..)
import Architecture.Action as Action exposing (..)
import Libs.Type    exposing (Food)
import Libs.Data    exposing (foodTypes)
import Libs.Helpers exposing (getDictValue)



tabs : Action.Model -> Dict String (List Food) -> Html Main.Msg
tabs { group, toggleGroupByTab } foodList =
  div
    [ classList
      [ ("tab-block", True)
      , ("_hide", not toggleGroupByTab)
      ]
    ] [ div [ class "tab-list" ] (tagList foodTypes foodList group) ]


tagList : List String -> Dict String (List Food) -> String -> List (Html Main.Msg)
tagList foodTypes foodList group =
  List.map (\name ->
    let value = getDictValue name foodList
    in
      div
        [ classList
          [ ("tab", True)
          , ("current", name == group)
          , ("_hide", List.length value == 0)
          ]
        , onClick (Action <| Group name)
        ] [ text name ]
  ) foodTypes

module Components.Tabs exposing (tabs)
import Html            exposing (Html, Attribute, div, text)
import Html.Attributes exposing (class)
import Html.Events     exposing (onClick)
import Dict exposing (Dict)

import Architecture.Main   as Main   exposing (..)
import Architecture.Action as Action exposing (..)
import Libs.Type    exposing (Food)
import Libs.Data    exposing (foodTypes)
import Libs.Helpers exposing (getDictValue)



tabs : Action.Model -> Dict String (List Food) -> Html Main.Msg
tabs { group, showBy } foodList =
  let toggle =
        if showBy == "標籤"
        then " _hide"
        else ""
      tagList = List.map (\name ->
        let value = getDictValue name foodList
            click = ActionMsg <| Group name
        in div [ classes (name == group) (List.length value == 0), onClick click ] [ text name ]
      ) foodTypes
  in div [ class ("tab-block" ++ toggle) ] [ div [ class "tab-list" ] tagList ]


classes : Bool -> Bool -> Attribute Main.Msg
classes isCurrentTag noResult =
  let class1 =
        if isCurrentTag
        then " current"
        else ""
      class2 =
        if noResult
        then " _hide"
        else ""
  in class ("tab" ++ class1 ++ class2)

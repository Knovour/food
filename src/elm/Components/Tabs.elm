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
tabs { group, isGroupByTab } foodList =
  if isGroupByTab
  then div [ class "tab-block" ] [ div [ class "tab-list" ] (tagList foodTypes foodList group) ]
  else text ""


tagList : List String -> Dict String (List Food) -> String -> List (Html Main.Msg)
tagList foodTypes foodList group =
  List.filterMap (\name ->
    let hasContent = List.length (getDictValue name foodList) /= 0
    in
      case hasContent of
        False -> Nothing
        True ->
          Just
            (div
              [ classList
                [ ("tab", True)
                , ("current", name == group)
                ]
              , onClick (Action <| Group name)
              ] [ text name ])
  ) foodTypes

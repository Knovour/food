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
tabs { group, showBy } foodList =
  let classes =
        classList
          [ ("tab-block", True)
          , ("_hide", showBy == "標籤")
          ]
      tagList = List.map (\name ->
          let value = getDictValue name foodList
              tabClasses =
                classList
                  [ ("tab", True)
                  , ("current", name == group)
                  , ("_hide", List.length value == 0)
                  ]
          in div [ tabClasses, onClick (Action <| Group name) ] [ text name ]
        ) foodTypes
  in div [ classes ] [ div [ class "tab-list" ] tagList ]

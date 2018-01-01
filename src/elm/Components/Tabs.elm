module Components.Tabs exposing (tabs)
import Html            exposing (Html, Attribute, div, a, text)
import Html.Attributes exposing (class, classList, href)
import Dict exposing (Dict)

import Architecture.Main   as Main   exposing (..)
import Architecture.Action as Action exposing (..)
import Libs.Type exposing (Food, FoodType)
import Libs.Data exposing (foodTypes)


tabs : Action.Model -> Dict String (List Food) -> Html Main.Msg
tabs { group } foodList =
  div [ class "tab-block" ] [ div [ class "tab-list" ] (tagList foodTypes foodList group) ]


tagList : List FoodType -> Dict String (List Food) -> String -> List (Html Main.Msg)
tagList foodTypes foodList group =
  List.map (\{ name, enName } ->
    a
      [ classList
        [ ("tab", True)
        , ("current", enName == group)
        ]
      , href ("#/" ++ enName)
      ] [ text name ]
  ) foodTypes

module Components.Tabs exposing (tabs)

import Dict exposing (Dict)
import Html exposing (Attribute, Html, a, div, text)
import Html.Attributes exposing (class, classList, href)

import Architecture.Action as Action exposing (..)
import Architecture.Main as Main exposing (..)
import Libs.Data exposing (foodTypes)
import Libs.Type exposing (Food, FoodType)


tabs : Action.Model -> Dict String (List Food) -> Html Main.Msg
tabs { group } foodList =
  div [ class "tab-block" ] [ div [ class "tab-list" ] (tagList foodTypes foodList group) ]


tagList : List FoodType -> Dict String (List Food) -> String -> List (Html Main.Msg)
tagList foodTypes foodList group =
  List.map
    (\{ name, enName } ->
      a
        [ classList
          [ ("tab", True)
          , ("current", enName == group)
          ]
        , href ("/" ++ enName)
        ]
        [ text name ]
    ) foodTypes

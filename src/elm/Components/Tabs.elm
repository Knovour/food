module Components.Tabs exposing (tabs)

import Html exposing (Html, a, div, text)
import Html.Attributes exposing (class, classList, href)

import Architecture.Action as Action exposing (..)
import Architecture.Main as Main exposing (..)
import Libs.Data exposing (foodTypes)
import Libs.Type exposing (FoodType)


tabs : Action.Model -> Html Main.Msg
tabs { group } =
  div [ class "tab-block" ] [ div [ class "tab-list" ] (tagList foodTypes group) ]


tagList : List FoodType -> String -> List (Html Main.Msg)
tagList foodTypes group =
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

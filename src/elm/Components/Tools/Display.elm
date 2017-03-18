module Components.Tools.Display exposing (..)
import Html            exposing (Html, div, p, i, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)

import Architecture.Main   as Main   exposing (..)
import Architecture.Action as Action exposing (..)



display : Action.Model -> Html Main.Msg
display action =
  div [ class "options-block toggle-display" ]
    [ p [ class "heading" ] [ text "顯示方式" ]
    , layout action.toggleCardLayout
    , tag action.toggleGroupByTab
    ]


layout : Bool -> Html Main.Msg
layout cardLayout =
  div
    [ classList
      [ ("display-switch", True)
      , ("toggle", not cardLayout)
      ]
    ] (switch [ "apps", "menu" ] "layout")


tag : Bool -> Html Main.Msg
tag groupByTab  =
  div
    [ classList
      [ ("display-switch", True)
      , ("toggle", not groupByTab)
      ]
    ] (switch [ "分頁", "標籤" ] "tag")


switch : List String -> String -> List (Html Main.Msg)
switch options target =
  List.map (\opt ->
    let classes = "opt " ++ target
        click =
          if target == "layout"
          then Action <| ToggleCardLayout
          else Action <| ToggleGroupByTab
        switchLabel =
          if target == "layout"
          then i [ class "material-icons icon" ] [ text opt ]
          else text opt
    in div [ class classes, onClick click ] [ switchLabel ]
  ) options

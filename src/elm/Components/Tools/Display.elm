module Components.Tools.Display exposing (..)
import Html            exposing (Html, div, p, text)
import Html.Attributes exposing (class, classList)
import Html.Events     exposing (onClick)

import Elements.Icon exposing (icon)
import Architecture.Main   as Main   exposing (..)
import Architecture.Action as Action exposing (..)



display : Action.Model -> Html Main.Msg
display { isCardLayout, isGroupByTab } =
  div [ class "options-block" ]
    [ p [ class "heading" ] [ text "顯示方式" ]
    , div [ class "toggle-display" ]
      [ layout isCardLayout
      , tag isGroupByTab
      ]
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
    if target == "layout"
    then div [ class ("opt " ++ target), onClick (Action IsCardLayout) ] [ icon opt ]
    else div [ class ("opt " ++ target), onClick (Action IsGroupByTab) ] [ text opt ]
  ) options

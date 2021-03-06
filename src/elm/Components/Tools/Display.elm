module Components.Tools.Display exposing (display, layout, switch)

import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)

import Architecture.Action as Action exposing (..)
import Architecture.Main as Main exposing (..)
import Elements.Icon exposing (icon)


display : Action.Model -> Html Main.Msg
display { isCardLayout } =
  div
    [ class "options-block" ]
    [ p [ class "heading" ] [ text "顯示方式" ]
    , div [ class "toggle-display" ] [ layout isCardLayout ]
    ]


layout : Bool -> Html Main.Msg
layout cardLayout =
  div
    [ classList
      [ ("display-switch", True)
      , ("toggle", not cardLayout)
      ]
    ]
    (switch [ "apps", "menu" ] "layout")


switch : List String -> String -> List (Html Main.Msg)
switch options target =
  List.map
    (\opt ->
      div [ class ("opt " ++ target), onClick (Action IsCardLayout) ] [ icon opt ]
    ) options

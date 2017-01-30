module Components.Tools.Display exposing (..)
import Html exposing (Html, div, p, i, text)
import Html.Attributes as Attr exposing (class)
import Html.Events as Event exposing (onClick)

import Msg.Main as Main exposing (..)
import Msg.Action exposing (..)
import Model.Action as Action



display : Action.Model -> Html Main.Msg
display action =
  div [ class "options-block" ]
    [ p [ class "heading" ] [ text "顯示方式" ]
    , layout action.layout
    , tag action.tag
    ]


layout : String -> Html Main.Msg
layout switch =
  let toggle = if switch == "menu" then " toggle" else ""
      options =
        List.map (\tag ->
          let active = if switch == tag then " _active" else ""
              click = (ActionMsg <| Layout tag)
          in div [ class ("layout opt" ++ active), onClick click ] [ i [ class "material-icons icon" ] [ text tag ] ]
        ) [ "apps", "menu" ]
  in div [ class ("display-switch" ++ toggle) ] options


tag : String -> Html Main.Msg
tag switch  =
  let toggle = if switch == "標籤" then " toggle" else ""
      options =
        List.map (\tag ->
          let active = if switch == tag then " _active" else ""
              click = (ActionMsg <| Tag tag)
          in div [ class ("tag opt" ++ active), onClick click ] [ text tag ]
        ) [ "分頁", "標籤" ]
  in div [ class ("display-switch" ++ toggle) ] options

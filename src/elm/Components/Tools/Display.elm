module Components.Tools.Display exposing (..)

import Html exposing (Html, div, p, i, text)
import Html.Attributes as Attr exposing (class)

import Msg.Main as Main exposing (..)

display : Html Main.Msg
display =
  div [ class "options-block" ]
    [ p [ class "heading" ] [ text "顯示方式" ]
    , div [ class "opts-box" ]
      [ div [ class "layout opt _active" ] [ i [ class "material-icons icon" ] [ text "apps" ] ]
      , div [ class "layout opt" ] [ i [ class "material-icons icon" ] [ text "menu" ] ]
      ]
    , div [ class "opts-box" ]
      [ div [ class "tag opt _active" ] [ text "分頁" ]
      , div [ class "tag opt" ] [ text "標籤" ]
      ]
    ]
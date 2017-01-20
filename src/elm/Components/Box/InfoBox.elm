module Components.Box.InfoBox exposing (..)

import Html exposing (Html, div, h5, a, ul, li, p, i, text, span)
import Html.Attributes exposing (class, style, href, target)
import Html.Events as Event exposing (onClick)

import Msg.Main as Main exposing (..)
import Msg.Box exposing (..)

colors : List { name : String, color : String, tag : String, font : String }
colors =
  [ { name = "胡粉", color = "#FFFFFB", tag = "GOFUN", font = "#373C38" }
  , { name = "白鼠", color = "#BDC0BA", tag = "SHIRONEZUMI", font = "#FFFFFB" }
  , { name = "銀鼠", color = "#91989F", tag = "GINNEZUMI", font = "#FFFFFB" }
  , { name = "藍墨茶", color = "#373C38", tag = "AISUMICHA", font = "#FFFFFB" }
  , { name = "白綠", color = "#A8D8B9", tag = "BYAKUROKU", font = "#FFFFFB" }
  , { name = "若竹", color = "#5DAC81", tag = "WAKATAKE", font = "#FFFFFB" }
  , { name = "青竹", color = "#00896C", tag = "AOTAKE", font = "#FFFFFB" }
  , { name = "老竹", color = "#6A8372", tag = "OITAKE", font = "#FFFFFB" }
  , { name = "空", color = "#58B2DC", tag = "SORA", font = "#FFFFFB" }
  , { name = "莓", color = "#B5495B", tag = "ICHIGO", font = "#FFFFFB" }
  ]

infoBox : Html Main.Msg
infoBox =
  let
    colorPalettes = List.map (\{ name, color, tag, font } ->
      a [ class "slot", href ("http://nipponcolors.com/#" ++ tag), target "_blank" ]
        [ div [ class "color-box", style [ ("background", color), ("color", font) ] ]
          [ div [ class "info" ]
            [ span [ class "name" ] [ text name ]
            , span [ class "hex" ] [ text color ]
            ]
          ]
        ]
    ) colors
  in
    div [ class "box-modal _slide-in _depth-4" ]
      [ i [ class "material-icons close", onClick (BoxMsg <| Close) ] [ text "close" ]
      , div [ class "box-content" ]
        [ h5 [ class "heading" ] [ text "關於" ]
        , ul [ class "info-list" ]
          [ li [ class "item" ]
            [ text "資料來源："
            , a
              [ class "link"
              , href "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductList.aspx?selectMonth=1&__M=True"
              , target "_blank"
              ] [ text "行政院農委會 - 田邊好幫手" ]
            ]
          , li [ class "item" ]
            [ text "專案修改自："
            , a
              [ class "link"
              , href "https://github.com/moarwick/elm-webpack-starter"
              , target "_blank"
              ] [ text "Elm Webpack Starter" ]
            ]
          , li [ class "item" ]
            [ text "架構參考："
            , a
              [ class "link"
              , href "https://medium.com/@_rchaves_/structured-todomvc-example-with-elm-a68d87cd38da#.pjdeirpjy"
              , target "_blank"
              ] [ text "Structured TodoMVC example with Elm" ]
            ]
          , li [ class "item" ]
            [ text "UI 參考："
            , a [ class "link", href "https://fonts.google.com/", target "_blank" ] [ text "Google Fonts" ]
            ]
          ]
        , h5 [ class "heading" ] [ text "顏色" ]
        , p [ class "subheading" ] [ text "From Nippon Colors" ]
        , div [ class "color-palette" ] colorPalettes
        ]
      ]
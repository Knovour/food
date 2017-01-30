module Components.Box.InfoBox exposing (..)
import Html exposing (Html, div, h5, a, ul, li, p, i, text, span)
import Html.Attributes exposing (class, style, href, target)
import Html.Events as Event exposing (onClick)

import Msg.Main as Main exposing (..)
import Msg.Box exposing (..)
import Libs.Data exposing (colorPalettes)



infoBox : Html Main.Msg
infoBox =
  let colorBlocks =
        List.map (\{ name, color, tag, font } ->
          a [ class "slot", href ("http://nipponcolors.com/#" ++ tag), target "_blank" ]
            [ div [ class "color-box", style [ ("background", color), ("color", font) ] ]
              [ div [ class "info" ]
                [ span [ class "name" ] [ text name ]
                , span [ class "hex" ] [ text color ]
                ]
              ]
            ]
        ) colorPalettes
      gov = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductList.aspx?selectMonth=1&__M=True"
      elmStarter = "https://github.com/moarwick/elm-webpack-starter"
      elmStructure = "https://medium.com/@_rchaves_/structured-todomvc-example-with-elm-a68d87cd38da#.pjdeirpjy"
      ui = "https://fonts.google.com/"
  in
    div [ class "box-modal _slide-in _depth-4" ]
      [ i [ class "material-icons close", onClick (BoxMsg <| Close) ] [ text "close" ]
      , div [ class "box-content" ]
        [ h5 [ class "heading" ] [ text "關於" ]
        , ul [ class "info-list" ]
          [ li [ class "item" ]
            [ text "資料來源："
            , a [ class "link", href gov, target "_blank" ] [ text "行政院農委會 - 田邊好幫手" ]
            ]
          , li [ class "item" ]
            [ text "專案修改自："
            , a [ class "link", href elmStarter, target "_blank" ] [ text "Elm Webpack Starter" ]
            ]
          , li [ class "item" ]
            [ text "架構參考："
            , a [ class "link", href elmStructure, target "_blank" ] [ text "Structured TodoMVC example with Elm" ]
            ]
          , li [ class "item" ]
            [ text "UI 參考："
            , a [ class "link", href ui, target "_blank" ] [ text "Google Fonts" ]
            ]
          ]
        , h5 [ class "heading" ] [ text "顏色" ]
        , p [ class "subheading" ] [ text "From Nippon Colors" ]
        , div [ class "color-palette" ] colorBlocks
        ]
      ]

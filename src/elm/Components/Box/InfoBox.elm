module Components.Box.InfoBox exposing (..)
import Html            exposing (Html, div, h5, a, ul, li, p, i, text, span)
import Html.Attributes exposing (class, style, href, target)
import Html.Events     exposing (onClick)

import Components.Link exposing (link)
import Architecture.Main as Main exposing (..)
import Architecture.Box  exposing (..)
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
      [ i [ class "material-icons close", onClick (Box <| Close) ] [ text "close" ]
      , div [ class "box-content" ]
        [ h5 [ class "heading" ] [ text "關於" ]
        , ul [ class "info-list" ]
          [ li [ class "item" ] [ text "資料來源：", link gov "行政院農委會 - 田邊好幫手" ]
          , li [ class "item" ] [ text "專案修改自：", link elmStarter "Elm Webpack Starter" ]
          , li [ class "item" ] [ text "架構參考：", link elmStructure "Structured TodoMVC example with Elm" ]
          , li [ class "item" ] [ text "UI 參考：", link ui "Google Fonts" ]
          ]
        , h5 [ class "heading" ] [ text "顏色" ]
        , p [ class "subheading" ] [ text "From Nippon Colors" ]
        , div [ class "color-palette" ] colorBlocks
        ]
      ]

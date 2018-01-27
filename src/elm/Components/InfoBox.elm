module Components.InfoBox exposing (..)
import Html            exposing (Html, div, h5, a, ul, li, p, text, span)
import Html.Attributes exposing (class, style, href, target)
import Html.Events     exposing (onClick)

import Elements.Link exposing (link)
import Elements.Icon exposing (icon)
import Architecture.Main as Main exposing (..)
import Architecture.Box  as Box exposing (..)



-- Data

type alias ColorPalette =
  { color : String
  , tag   : String
  , name  : String
  }

colorPalettes : List ColorPalette
colorPalettes =
  [ { color = "#FFFFFB", tag = "GOFUN",       name = "胡粉" }
  , { color = "#BDC0BA", tag = "SHIRONEZUMI", name = "白鼠" }
  , { color = "#91989F", tag = "GINNEZUMI",   name = "銀鼠" }
  , { color = "#373C38", tag = "AISUMICHA",   name = "藍墨茶" }
  , { color = "#A8D8B9", tag = "BYAKUROKU",   name = "白綠" }
  , { color = "#5DAC81", tag = "WAKATAKE",    name = "若竹" }
  , { color = "#00896C", tag = "AOTAKE",      name = "青竹" }
  , { color = "#6A8372", tag = "OITAKE",      name = "老竹" }
  , { color = "#58B2DC", tag = "SORA",        name = "空" }
  , { color = "#B5495B", tag = "ICHIGO",      name = "莓" }
  ]



-- Component

infoBox : Box.Model -> Html Main.Msg
infoBox { open } =
  case not open of
    True  -> text ""
    False ->
      let gov = "http://life.coa.gov.tw/Life/AgriculturalProducts/SeasonProductList.aspx?selectMonth=1&__M=True"
          ui  = "https://fonts.google.com/"
          pixabay = "https://pixabay.com/"
          pakutaso = "https://www.pakutaso.com/"
          suzaiPage = "http://www.sozai-page.com"
      in
        div [ class "box-modal -depth-4" ]
          [ div [ class "close", onClick (Box Close) ] [ icon "close" ]
          , div [ class "box-content" ]
            [ div [ class "about"]
              [ h5 [ class "heading" ] [ text "關於" ]
              , ul [ class "info-list" ]
                [ li [ class "item" ] [ text "資料來源：", link gov "行政院農委會 - 田邊好幫手" ]
                , li [ class "item" ] [ text "UI 參考：", link ui "Google Fonts" ]
                ]
              ]
            , div [ class "source"]
              [ h5 [ class "heading" ] [ text "圖片來源" ]
              , p [ class "subheading" ] [ text "找不到的圖以方塊或相同種類的圖代替" ]
              , ul [ class "info-list" ]
                [ li [ class "item" ] [ link pixabay "Pixabay" ]
                , li [ class "item" ] [ link pakutaso "ぱくたそ" ]
                , li [ class "item" ] [ link suzaiPage "無料DTP素材" ]
                ]
              ]
            , div [ class "colors" ]
              [ h5 [ class "heading" ] [ text "顏色" ]
              , p [ class "subheading" ] [ text "From Nippon Colors" ]
              , div [ class "color-palette" ] (colorBlocks colorPalettes)
              ]
            ]
          ]


colorBlocks : List ColorPalette -> List (Html Main.Msg)
colorBlocks colorPalettes =
  List.map (\{ name, color, tag } ->
    let fontColor = if color /= "#FFFFFB" then "#FFFFFB" else "#373C38"
        colorLink = "http://nipponcolors.com/#" ++ tag
    in
      a [ class "slot", href colorLink, target "_blank" ]
        [ div [ class "color-box", style [ ("background", color), ("color", fontColor) ] ]
          [ div [ class "info" ]
            [ span [ class "name" ] [ text name ]
            , span [ class "hex" ] [ text color ]
            ]
          ]
        ]
  ) colorPalettes

module Components.Tools.Tools exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)

import Libs.Helper exposing (include)
import Components.Tools.Month as Month exposing (month)
import Msg.Main as Main exposing (..)
import Model.Action as Action


tools : Action.Model -> Html Main.Msg
tools action =
  let
    group1 = List.map (\num -> month [ Month.highlight (include action.hover num) ] [ Month.current num ]) (List.range 1 6)
    group2 = List.map (\num -> month [ Month.highlight (include action.hover num) ] [ Month.current num ]) (List.range 7 12)
  in
    div [ class "tools" ]
      [ div [ class "view-options" ]
        [ p [ class "heading" ] [ text "顯示方式" ]
        , div [ class "opts-group"]
          [ div [ class "opts" ]
            [ div [ class "layout grid view active" ] [ i [ class "material-icons" ] [ text "apps" ] ]
            , div [ class "layout list view" ] [ i [ class "material-icons" ] [ text "menu" ] ]
            ]
          , div [ class "opts" ]
            [ div [ class "group view active" ] [ text "分頁" ]
            , div [ class "group view" ] [ text "標籤" ]
            ]
          ]
        ]
      , div [ class "month-group" ]
        [ p [ class "heading" ] [ text "月份" ]
        , div [ class "group" ] group1
        , div [ class "group" ] group2
        ]
      , footer [ class "footer" ]
        [ div [ class "copyright" ] [ text "2017 © Knovour" ]
        , div [ class "links" ]
          [ a [ href "https://notes.knovour.ninja", target "_blank" ] [ text "Blog" ]
          , span [ class "middot" ] [ text "·" ]
          , a [ href "https://github.com/Knovour/food", target "_blank" ] [ text "GitHub" ]
          , span [ class "middot" ] [ text "·" ]
          , span []
            [ text "Made by "
            , a [ href "http://elm-lang.org" ] [ text "Elm" ]
            ]
          ]
        ]
      ]

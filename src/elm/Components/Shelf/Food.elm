module Components.Shelf.Food exposing (..)
import Html            exposing (Html, div, span, img, text, i, a)
import Html.Attributes exposing (class, classList, src, alt, href, target)
import Html.Events     exposing (onMouseEnter, onMouseLeave)

import Architecture.Main   as Main exposing (..)
import Architecture.Action exposing (..)
import Libs.Type exposing (Food)



food : Food -> Html Main.Msg
food food =
  let harvest =
        List.map (\month ->
          div
            [ classList
              [ ("dot", True)
              , ("current", (List.member month food.harvest))
              ]
            ] []
        ) (List.range 1 12)
      hover = Action <| Hover food.harvest
      unHover = Action <| Hover []
  in
    div [ class "food-card", onMouseEnter hover, onMouseLeave unHover ]
      [ div [ class "media" ] [ img [ class "img", src food.image, alt "" ] [] ]
      , div [ class "info" ]
        [ div [ class "harvest-calendar" ] harvest
        , span [ class "name" ] [ text food.name ]
        , a [ class "copyright", href food.source, target "_blank" ] [ text "圖片來源" ]
        ]
      ]


list : List Food -> List (Html Main.Msg)
list foodList = List.map (\foodData -> food foodData) foodList

module Components.Shelf.Food exposing (..)
import Html exposing (Html, div, span, img, text, i, a)
import Html.Attributes exposing (class, src, alt, href, target)
import Html.Events as Event exposing (onMouseEnter, onMouseLeave)

import Libs.Type exposing (Food)
import Msg.Action exposing (..)
import Msg.Main as Main exposing (..)



food : Food -> Html Main.Msg
food food =
  let harvest =
        List.map (\month ->
          let classes = if (List.member month food.harvest) then " current" else ""
          in  div [ class ("dot" ++ classes) ] []
        ) (List.range 1 12)
      hover = (ActionMsg <| Hover food.harvest)
      unHover =  (ActionMsg <| Hover [])
  in
    div [ class "food-card", onMouseEnter hover, onMouseLeave unHover ]
      [ div [ class "media" ] [ img [ class "img", src food.image, alt "" ] [] ]
      , div [ class "info" ]
        [ div [ class "harvest-light" ] harvest
        , span [ class "name" ] [ text food.name ]
        , a [ class "copyright", href food.source, target "_blank" ] [ text "圖片來源" ]
        ]
      ]


list : List Food -> List (Html Main.Msg)
list foodList = List.map (\foodData -> food foodData) foodList

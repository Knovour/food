module Components.Food exposing (..)

import Html exposing (Html, div, span, img, text, i, a)
import Html.Attributes exposing (..)
import Html.Events as Event exposing (onClick)

import Libs.Type exposing (Food)
import Msg.Main as Main exposing (..)
import Msg.Box as Box exposing (..)


has : List Int -> Int -> Bool
has monthList current = List.member current monthList


renderFood : Food -> Html Main.Msg
renderFood food =
  div [ class "food-card", onClick (BoxMsg <| Open food.name) ]
    [ div [ class "media" ]
      [ img [ class "img", src ("https://dl.dropboxusercontent.com/u/1419724/img/" ++ food.name ++ ".webp"), alt "" ] []
      ]
    , div [ class "info" ]
      [ span [ class "name" ] [ text food.name ]
      , a [ class "copyright", href food.imgFrom, target "_blank" ] [ text "圖片來源" ]
      ]
    ]


render : List Food -> Int -> List (Html Main.Msg)
render foodList currentMonth =
  List.map
    (\food ->
      if currentMonth == 0 || food.harvest `has` currentMonth then
        renderFood food
      else
        text ""
    )
    foodList

module Components.Food exposing (..)

import Html exposing (Html, div, span, img, text, i, a)
import Html.Attributes exposing (..)
import Html.Events as Event exposing (onMouseEnter, onMouseLeave)
import String exposing (isEmpty, contains)
import Libs.Type exposing (Food)
import Libs.Helper exposing (include)
import Msg.Action exposing (..)
import Msg.Main as Main exposing (..)
import Model.Search as Search



renderFood : Food -> Html Main.Msg
renderFood food =
  let
    harvest = List.map (\month ->
      let
        classes =
          if (include food.harvest month) then
            "current"
          else
            ""
      in
        div [ class ("dot " ++ classes) ] []
    ) (List.range 1 12)
  in

  div [ class "food-card", onMouseEnter (ActionMsg <| Hover food.harvest), onMouseLeave (ActionMsg <| Hover []) ]
    [ div [ class "media" ]
      [ img [ class "img", src food.image, alt "" ] []
      ]
    , div [ class "info" ]
      [ div [ class "harvest-light" ] harvest
      , span [ class "name" ] [ text food.name ]
      , a [ class "copyright", href food.source, target "_blank" ] [ text "圖片來源" ]
      ]
    ]


render : List Food -> Search.Model -> List (Html Main.Msg)
render foodList searchModel =
  List.map (\food ->
    let
      currentMonth = searchModel.current
      inCurrentMonth = currentMonth == 0 || include food.harvest currentMonth

      searchName = searchModel.name
      inSearchResult = isEmpty searchName || contains searchName food.name
    in
      if inCurrentMonth && inSearchResult then
        renderFood food
      else
        text ""
  ) foodList

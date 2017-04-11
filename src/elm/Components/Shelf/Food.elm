module Components.Shelf.Food exposing (..)
import Html            exposing (Html, div, span, img, text, i, a)
import Html.Attributes exposing (class, classList, src, alt, href, target)
import Html.Events     exposing (onMouseEnter, onMouseLeave)

import Architecture.Main   as Main exposing (..)
import Architecture.Action as Action exposing (..)
import Libs.Type exposing (Food)



food : Food -> Action.Model -> Html Main.Msg
food data { toggleCardLayout } =
  let classes =
        classList
          [ ("food-info", True)
          , ("-card", toggleCardLayout)
          , ("-list", not toggleCardLayout)
          ]
  in
    div
      [ classes
      , onMouseEnter (Action <| Hover data.harvest)
      , onMouseLeave (Action <| Hover [])
      ]
      [ div [ class "media" ] [ img [ class "img", src data.image, alt "" ] [] ]
      , span [ class "name" ] [ text data.name ]
      , a [ class "copyright", href data.source, target "_blank" ] [ text "圖片來源" ]
      , div [ class "harvest-calendar" ] (dotList data.harvest)
      ]


dotList : List Int -> List (Html Main.Msg)
dotList harvestList =
  List.map (\month ->
    div
      [ classList
        [ ("dot", True)
        , ("current", (List.member month harvestList))
        ]
      ] []
  ) (List.range 1 12)

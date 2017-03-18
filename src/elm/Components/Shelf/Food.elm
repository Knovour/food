module Components.Shelf.Food exposing (..)
import Html            exposing (Html, div, span, img, text, i, a)
import Html.Attributes exposing (class, classList, src, alt, href, target)
import Html.Events     exposing (onMouseEnter, onMouseLeave)

import Architecture.Main   as Main exposing (..)
import Architecture.Action as Action exposing (..)
import Libs.Type exposing (Food)



food : Food -> Action.Model -> Html Main.Msg
food data action =
  let classes =
        classList
          [ ("food-info", True)
          , ("_card", action.toggleCardLayout)
          , ("_list", not action.toggleCardLayout)
          ]
      harvest =
        List.map (\month ->
          div
            [ classList
              [ ("dot", True)
              , ("current", (List.member month data.harvest))
              ]
            ] []
        ) (List.range 1 12)
      hover = Action <| Hover data.harvest
      unHover = Action <| Hover []
  in
    div [ classes, onMouseEnter hover, onMouseLeave unHover ]
      [ div [ class "media" ] [ img [ class "img", src data.image, alt "" ] [] ]
      , span [ class "name" ] [ text data.name ]
      , a [ class "copyright", href data.source, target "_blank" ] [ text "圖片來源" ]
      , div [ class "harvest-calendar" ] harvest
      ]


list : List Food -> Action.Model -> List (Html Main.Msg)
list foodList action = List.map (\foodData -> food foodData action) foodList

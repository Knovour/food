module Components.Shelf.Food exposing (..)
import Html            exposing (Html, div, span, img, text)
import Html.Attributes exposing (class, classList, src, alt)
import Html.Events     exposing (onMouseEnter, onMouseLeave)

import Architecture.Main   as Main exposing (..)
import Architecture.Action as Action exposing (..)
import Libs.Type exposing (Food)



food : Action.Model -> Food -> Html Main.Msg
food { isCardLayout } data =
  div
    [ classList
      [ ("food-info", True)
      , ("-card", isCardLayout)
      , ("-list", not isCardLayout)
      ]
    , onMouseEnter (Action <| Hover data.harvest)
    , onMouseLeave (Action <| Hover [])
    ]
    [ div [ class "media" ] [ img [ class "img", src data.image, alt "" ] [] ]
    , span [ class "name" ] [ text data.name ]
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

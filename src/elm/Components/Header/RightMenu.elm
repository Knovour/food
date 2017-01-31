module Components.Header.RightMenu exposing (..)
import Html            exposing (Html, div, text, i)
import Html.Attributes exposing (class)
import Html.Events     exposing (onClick)

import Architecture.Main as Main exposing (..)
import Architecture.Box  exposing (..)



rightMenu : Html Main.Msg
rightMenu =
  div [ class "right-menu" ]
    [ div [ class "info-btn _depth-1", onClick (BoxMsg <| Open "info") ] [ i [ class "material-icons icon" ] [ text "priority_high" ] ]
    ]

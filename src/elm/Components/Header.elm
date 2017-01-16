module Components.Header exposing (render)

import Html exposing (..)
import Html.Attributes exposing (..)


render : Html msg
render =
  header [ class "header-block" ]
    [ img [ class "header", src "https://dl.dropboxusercontent.com/u/1419724/img/logo.svg", alt "logo" ] []
    , div [ class "search" ]
      [ label [ class "label material-icons", for "search" ] [ text "search" ]
      , input [ id "search", type_ "search", name "search", placeholder "Search..." ] []
      ]
    , div [ class "right-menu" ]
      [ div [ class "important-btn _depth-1" ] [ i [ class "material-icons" ] [ text "priority_high" ] ]
      ]
    ]

module Components.Header exposing (render)

import Html exposing (Html, header, div, img, h1, i, a, text)
import Html.Attributes exposing (..)


render : Html msg
render =
  header [ class "header-block" ]
    [ img [ class "header", src "https://dl.dropboxusercontent.com/u/1419724/img/logo.svg", alt "logo" ] []
    , div [ class "right-menu" ]
      [ a [ href "https://github.com/Knovour/food", target "_blank" ] [ i [ class "mdi mdi-github-box" ] [] ]
      ]
    ]

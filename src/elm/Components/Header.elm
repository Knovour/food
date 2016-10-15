module Components.Header exposing (render)

import Html exposing (Html, header, div, h1, i, a, text)
import Html.Attributes exposing (class, href, target)


render : Html msg
render =
  header [ class "header-block" ]
    [ h1 [ class "header" ] [ text "當季蔬果一覽" ]
    , div [ class "right-menu" ]
      [ a [ href "https://github.com/Knovour/food", target "_blank" ] [ i [ class "mdi mdi-github-box" ] [] ]
      ]
    ]

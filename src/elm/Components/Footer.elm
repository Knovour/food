module Components.Footer exposing (render)

import Html exposing (Html, footer, text, a, i)
import Html.Attributes exposing (..)

render : Html msg
render =
  footer [ class "footer-block" ] [
    i [ class "mdi mdi-copyright" ] [],
    text " 當季蔬果一覽 | ",
    a [ href "https://github.com/Knovour/food" ] [ text "GitHub" ]
  ]
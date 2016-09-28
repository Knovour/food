module Components.Footer exposing (render)

import Html exposing (Html, footer, text, i)
import Html.Attributes exposing (class)

render : Html msg
render =
  footer [ class "footer-block" ] [
    i [ class "mdi mdi-copyright" ] [],
    text " 當季蔬果一覽"
  ]
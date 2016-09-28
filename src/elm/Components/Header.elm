module Components.Header exposing (render)

import Html exposing (Html, header, h1, text)
import Html.Attributes exposing (class)

render : Html msg
render =
  header [ class "header-block" ] [
    h1 [ class "header" ] [ text "當季蔬果一覽" ]
  ]
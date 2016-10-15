module Components.Goods exposing (render)

import Html exposing (Html, div)
import Html.Attributes exposing (class)


render : List (Html msg) -> Html msg
render elemList =
  div [ class "goods" ] elemList

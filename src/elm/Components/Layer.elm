module Components.Layer exposing (label, render)

import Html exposing (..)
import Html.Attributes exposing (class, attribute)


label : String -> Html msg
label currentType =
  h2 [ class "label" ] [ text currentType ]


render : { species : String } -> List (Html msg) -> Html msg
render attr elemList =
  div [ class "layer", attribute "data-type" attr.species ] elemList

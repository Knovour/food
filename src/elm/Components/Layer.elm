module Components.Layer exposing (label, render)

import Html exposing (..)
import Html.Attributes exposing (class, attribute)


label : String -> Html msg
label currentType =
  h2 [ class "label" ] [ text currentType ]


render : String -> List (Html msg) -> Html msg
render species elemList = div [ class "layer", attribute "data-type" species ] elemList

module Components.Shelf.Layer exposing (dataType, layer)

import Html exposing (Attribute, Html, div)
import Html.Attributes exposing (attribute, class)


layer : List (Attribute msg) -> List (Html msg) -> Html msg
layer attr slot = div (attr ++ [ class "layer" ]) slot


dataType : String -> Attribute msg
dataType species = attribute "data-type" species

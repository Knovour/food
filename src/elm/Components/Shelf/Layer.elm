module Components.Shelf.Layer exposing (..)
import Html            exposing (Html, Attribute, div)
import Html.Attributes exposing (class, attribute)



layer : List (Attribute msg) -> List (Html msg) -> Html msg
layer attr slot = div (attr ++ [ class "layer" ]) slot


dataType : String -> Attribute msg
dataType species = attribute "data-type" species

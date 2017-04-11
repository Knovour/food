module Components.Shelf.Layer exposing (..)
import Html            exposing (Html, Attribute, div)
import Html.Attributes exposing (classList, attribute)



layer : List (Attribute msg) -> List (Html msg) -> Html msg
layer attr slot = div attr slot


display : Bool -> Attribute msg
display isFocus =
  classList
    [ ("layer", True)
    , ("_hide", not isFocus)
    ]


dataType : String -> Attribute msg
dataType species = attribute "data-type" species

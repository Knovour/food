module Components.Shelf.Layer exposing (..)
import Html            exposing (Html, Attribute, h2, div, text)
import Html.Attributes exposing (class, classList, attribute)



layer : List (Attribute msg) -> List (Html msg) -> Html msg
layer attr slot = div attr slot


display : Bool -> Attribute msg
display isFocus =
  classList
    [ ("layer", True)
    , ("_hide", not isFocus)
    ]

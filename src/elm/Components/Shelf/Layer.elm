module Components.Shelf.Layer exposing (..)
import Html            exposing (Html, Attribute, h2, div, text)
import Html.Attributes exposing (class, attribute)



layer : List (Attribute msg) -> List (Html msg) -> Html msg
layer attr slot = div attr slot


show : Bool -> Attribute msg
show isFocus =
  if isFocus
  then class "layer"
  else class "layer _hide"

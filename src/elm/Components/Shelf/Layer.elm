module Components.Shelf.Layer exposing (..)
import Html exposing (Html, Attribute, h2, div, text)
import Html.Attributes exposing (class, attribute)



layer : List (Attribute msg) -> List (Html msg) -> Html msg
layer attr slot = div attr slot


show : Bool -> Attribute msg
show isFocus =
  if isFocus then
    class "layer"
  else
    class "layer _hide"


dataType : String -> Attribute msg
dataType species = attribute "data-type" species


labelView : String -> Attribute msg
labelView tag =
  if tag == "分頁" then
    class "label _hide"
  else
    class "label"


name : List (Attribute msg) -> List (Html msg) -> Html msg
name attr slot = h2 attr slot


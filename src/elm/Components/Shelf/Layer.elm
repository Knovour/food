module Components.Shelf.Layer exposing (..)

import Html exposing (Html, Attribute, h2, div, text)
import Html.Attributes exposing (class, attribute)


show : Bool -> Attribute msg
show isFocus =
  if isFocus then
    class "layer"
  else
    class "layer _hide"


dataType : String -> Attribute msg
dataType species = attribute "data-type" species


name : String -> Html msg
name name =
  h2 [ class "label" ] [ text name ]


layer : List (Attribute msg) -> List (Html msg) -> Html msg
layer attr slot = div attr slot

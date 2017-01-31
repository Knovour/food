module Components.Tag exposing (..)
import Html            exposing (Html, Attribute, h2, div, text)
import Html.Attributes exposing (class)



tag : List (Attribute msg) -> List (Html msg) -> Html msg
tag attr slot = h2 attr slot


show : String -> Attribute msg
show display =
  if display == "分頁"
  then class "label _hide"
  else class "label"

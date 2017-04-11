module Components.Tag exposing (..)
import Html            exposing (Html, Attribute, h2)
import Html.Attributes exposing (classList)



tag : List (Attribute msg) -> List (Html msg) -> Html msg
tag attr slot = h2 attr slot


show : Bool -> Attribute msg
show groupByTab =
  classList
    [ ("label", True)
    , ("_hide", groupByTab)
    ]

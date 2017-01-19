module Components.Shelf.Goods exposing (goods)

import Html exposing (Html, Attribute, div)
import Html.Attributes exposing (class)


goods : List (Attribute msg) -> List (Html msg) -> Html msg
goods attr slot = div [ class "goods" ] slot

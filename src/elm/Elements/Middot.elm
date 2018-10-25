module Elements.Middot exposing (middot)

import Html exposing (Html, span, text)
import Html.Attributes exposing (class)


middot : Html msg
middot =
  span [ class "middot" ] [ text "·" ]

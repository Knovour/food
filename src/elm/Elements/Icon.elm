module Elements.Icon exposing (icon)

import Html exposing (Html, i, text)
import Html.Attributes exposing (class)


icon : String -> Html msg
icon name =
  i [ class "material-icons icon" ] [ text name ]

module Components.Tag exposing (..)
import Html            exposing (Html, span, text)
import Html.Attributes exposing (class)



tag : Bool -> String -> Html msg
tag showByTab species =
  if not showByTab
  then span [ class "label" ] [ text species ]
  else text ""

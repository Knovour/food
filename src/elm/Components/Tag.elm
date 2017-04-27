module Components.Tag exposing (..)
import Html            exposing (Html, h2, text)
import Html.Attributes exposing (class)



tag : Bool -> String -> Html msg
tag showByTab species =
  if not showByTab
  then h2 [ class "label" ] [ text species ]
  else text ""

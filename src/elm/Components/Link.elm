module Components.Link exposing (link)
import Html            exposing (Html, a, text)
import Html.Attributes exposing (class, href, target)



link : String -> String -> Html msg
link to name =
  a [ class "link", href to, target "_blank" ] [ text name ]

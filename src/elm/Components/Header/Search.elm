module Components.Header.Search exposing (..)
import Html            exposing (Html, div, label, text, input, i)
import Html.Attributes exposing (class, for, id, type_, name, placeholder, value)
import Html.Events     exposing (onInput, onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Search exposing (..)



search : Main.Model -> Html Main.Msg
search { search } =
  let
    clear =
      if search.name /= ""
      then i [ class "material-icons clear", onClick (Search <| Name "")] [ text "clear" ]
      else text ""
  in
    div [ class "search-bar" ]
      [ label [ class "material-icons label", for "search" ] [ text "search" ]
      , input
        [ id "search"
        , class "search"
        , type_ "search"
        , name "search"
        , placeholder "Search..."
        , value search.name
        , onInput (\value -> Search <| Name value)
        ] []
      , clear
      ]

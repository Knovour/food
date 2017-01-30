module Components.Header.Search exposing (..)
import Html            exposing (Html, div, label, text, input)
import Html.Attributes exposing (class, for, id, type_, name, placeholder, value)
import Html.Events     exposing (onInput, onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Search exposing (..)



search : String -> Html Main.Msg
search searchInput =
  let icon = if String.length searchInput > 0 then "close" else "search"
      click = SearchMsg <| Name ""
  in
    div [ class "search-bar" ]
      [ label [ class "label material-icons", for "search", onClick click ] [ text icon ]
      , input
        [ id "search"
        , type_ "search"
        , name "search"
        , placeholder "Search..."
        , value searchInput
        , onInput (\value -> SearchMsg <| Name value)
        ] []
      ]

module Components.Header.Search exposing (..)
import Html            exposing (Html, div, label, text, input)
import Html.Attributes exposing (class, for, id, type_, name, placeholder, value)
import Html.Events     exposing (onInput, onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Search exposing (..)



search : String -> Html Main.Msg
search searchVal =
  let icon = if String.length searchVal > 0 then "close" else "search"
  in
    div [ class "search-bar" ]
      [ label [ class "label material-icons", for "search", onClick (SearchMsg <| Name "") ] [ text icon ]
      , input
        [ id "search"
        , type_ "search"
        , name "search"
        , placeholder "Search..."
        , value searchVal
        , onInput (\value -> SearchMsg <| Name value)
        ] []
      ]

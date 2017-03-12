module Components.Header.Search exposing (..)
import Html            exposing (Html, div, label, text, input)
import Html.Attributes exposing (class, classList, for, id, type_, name, placeholder, value)
import Html.Events     exposing (onInput, onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Search exposing (..)



search : Main.Model -> Html Main.Msg
search { action, screen, search } =
  let classes =
        classList
          [ ("search-bar", True)
          , ("_hide", (action.toggleSearch == "close" && screen.width > 976))
          ]
      icon =
        if String.length search.name > 0
        then "delete_sweep"
        else "search"
  in
    div [ classes ]
      [ label [ class "label material-icons", for "search", onClick (Search <| Name "") ] [ text icon ]
      , input
        [ id "search"
        , type_ "search"
        , name "search"
        , placeholder "Search..."
        , value search.name
        , onInput (\value -> Search <| Name value)
        ] []
      ]

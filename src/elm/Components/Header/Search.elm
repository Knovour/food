module Components.Header.Search exposing (..)
import Html exposing (Html, div, label, text, input)
import Html.Attributes exposing (class, for, id, type_, name, placeholder)
import Html.Events as Event exposing (onInput)

import Msg.Main as Main exposing (..)
import Msg.Search exposing (..)

search : Html Main.Msg
search =
  div [ class "search-bar" ]
    [ label [ class "label material-icons", for "search" ] [ text "search" ]
    , input
      [ id "search"
      , type_ "search"
      , name "search"
      , placeholder "Search..."
      , onInput (\value -> SearchMsg <| Name value)
      ] []
    ]

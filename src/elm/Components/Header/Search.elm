module Components.Header.Search exposing (search)

import Html exposing (Html, div, input, label, span, text)
import Html.Attributes exposing (class, classList, for, id, name, placeholder, type_, value)
import Html.Events exposing (onClick, onInput)

import Architecture.Filter as Filter exposing (..)
import Architecture.Main as Main exposing (..)
import Elements.Icon exposing (icon)


search : Filter.Model -> Html Main.Msg
search model =
  div [ class "search-bar" ]
    [ label [ class "label", for "search" ] [ icon "search" ]
    , input
      [ id "search"
      , type_ "search"
      , name "search"
      , placeholder "Search"
      , value model.name
      , onInput (Filter << Name)
      ]
      []
    , span
      [ classList
        [ ( "clear", True )
        , ( "-hide", model.name == "" )
        ]
      , onClick (Filter <| Name "")
      ]
      [ icon "clear" ]
    ]

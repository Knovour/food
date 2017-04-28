module Components.Header.Search exposing (..)
import Html            exposing (Html, div, label, span, text, input)
import Html.Attributes exposing (class, classList, for, id, type_, name, placeholder, value)
import Html.Events     exposing (onInput, onClick)


import Elements.Icon exposing (icon)
import Architecture.Main   as Main exposing (..)
import Architecture.Filter as Filter exposing (..)



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
      ] []
    , span
      [ classList
        [ ("clear", True)
        , ("-hide", model.name == "")
        ]
      , onClick (Filter <| Name "")
      ] [ icon "clear" ]
    ]

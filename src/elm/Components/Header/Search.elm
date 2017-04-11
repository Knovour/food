module Components.Header.Search exposing (..)
import Html            exposing (Html, div, label, text, input, i)
import Html.Attributes exposing (class, classList, for, id, type_, name, placeholder, value)
import Html.Events     exposing (onInput, onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Search as Search exposing (..)



search : Search.Model -> Html Main.Msg
search model =
  div [ class "search-bar" ]
    [ label [ class "material-icons label", for "search" ] [ text "search" ]
    , input
      [ id "search"
      , class "search"
      , type_ "search"
      , name "search"
      , placeholder "Search..."
      , value model.name
      , onInput (\value -> Search <| Name value)
      ] []
    , clearIcon model.name
    ]


clearIcon : String -> Html Main.Msg
clearIcon searchText =
  i
    [ classList
      [ ("material-icons clear", True)
      , ("_hide", searchText == "")
      ]
    , onClick (Search <| Name "")
    ] [ text "clear" ]

module Components.Header exposing (header_)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events as Event exposing (onInput)
import Msg.Main as Main exposing (..)
import Msg.Search exposing (..)


header_ : Html Main.Msg
header_ =
  header [ class "header-block" ]
    [ img [ class "header", src "https://dl.dropboxusercontent.com/u/1419724/img/logo.svg", alt "logo" ] []
    , div [ class "search" ]
      [ label [ class "label material-icons", for "search" ] [ text "search" ]
      , input
        [ id "search"
        , type_ "search"
        , name "search"
        , placeholder "Search..."
        , onInput (\value -> SearchMsg <| Name value)
        ] []
      ]
    , div [ class "right-menu" ]
      [ div [ class "important-btn _depth-1" ] [ i [ class "material-icons" ] [ text "priority_high" ] ]
      ]
    ]

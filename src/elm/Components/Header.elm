module Components.Header exposing (header_)

import Html exposing (Html, header, img, div, i, text)
import Html.Attributes exposing (class, src, alt)
import Html.Events as Event exposing (onClick)

import Msg.Main as Main exposing (..)
import Msg.Box exposing (..)

import Components.Header.Search exposing (search)


header_ : Html Main.Msg
header_ =
  header [ class "header-block" ]
    [ img [ class "logo", src "https://dl.dropboxusercontent.com/u/1419724/img/logo.svg", alt "logo" ] []
    , search
    , div [ class "right-menu" ]
      [ div [ class "information-btn _depth-1", onClick (BoxMsg <| Open "information") ] [ i [ class "material-icons icon" ] [ text "priority_high" ] ]
      ]
    ]

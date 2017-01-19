module Components.Header exposing (header_)

import Html exposing (Html, header, img, div, i, text)
import Html.Attributes exposing (class, src, alt)

import Msg.Main exposing (Msg)

import Components.Header.Search exposing (search)


header_ : Html Msg
header_ =
  header [ class "header-block" ]
    [ img [ class "logo", src "https://dl.dropboxusercontent.com/u/1419724/img/logo.svg", alt "logo" ] []
    , search
    , div [ class "right-menu" ]
      [ div [ class "important-btn _depth-1" ] [ i [ class "material-icons icon" ] [ text "priority_high" ] ]
      ]
    ]

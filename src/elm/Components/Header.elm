module Components.Header exposing (header_)
import Html            exposing (Html, header, img, div, i, text)
import Html.Attributes exposing (class, src, alt)
import Html.Events     exposing (onClick)

import Architecture.Main as Main exposing (..)
import Architecture.Box exposing (..)
import Components.Header.Search exposing (search)



header_ : String -> Html Main.Msg
header_ searchInput =
  header [ class "header-block" ]
    [ img [ class "logo", src "https://dl.dropboxusercontent.com/u/1419724/img/logo.svg", alt "logo" ] []
    , search searchInput
    , div [ class "right-menu" ]
      [ div [ class "information-btn _depth-1", onClick (BoxMsg <| Open "information") ] [ i [ class "material-icons icon" ] [ text "priority_high" ] ]
      ]
    ]

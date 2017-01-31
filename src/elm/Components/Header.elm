module Components.Header exposing (header_)
import Html            exposing (Html, header, img, div)
import Html.Attributes exposing (class, src, alt)

import Architecture.Main as Main exposing (..)
import Components.Header.Search    exposing (search)
import Components.Header.RightMenu exposing (rightMenu)



header_ : String -> Html Main.Msg
header_ searchVal =
  header [ class "header-block" ]
    [ img [ class "logo", src "https://dl.dropboxusercontent.com/u/1419724/img/logo.svg", alt "logo" ] []
    , search searchVal
    , rightMenu
    ]

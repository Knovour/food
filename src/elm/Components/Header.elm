module Components.Header exposing (header_)
import Html            exposing (Html, header, img, div)
import Html.Attributes exposing (class, src, alt)

import Architecture.Main as Main exposing (..)
import Components.Header.Search    exposing (search)
import Components.Header.RightMenu exposing (rightMenu)



header_ : Model -> Html Main.Msg
header_ model =
  let
    { action, screen } = model
    classes =
      if (action.sidebar == "close" && screen.width > 976)
      then " -extend"
      else ""
    logo =
      if screen.width > 976
      then "https://dl.dropboxusercontent.com/u/1419724/img/logo.svg"
      else "https://dl.dropboxusercontent.com/u/1419724/img/logo-white.svg"
  in
    header [ class ("header-block" ++ classes) ]
      [ div [ class "main-nav" ]
        [ img [ class "logo", src logo, alt "logo" ] []
        , search model
        , rightMenu model
        ]
      , search model
      ]

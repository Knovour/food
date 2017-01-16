module Components.Tags exposing (tags)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Msg.Main as Main exposing (..)
import Libs.Data exposing (foodTypes)


tags : Html Main.Msg
tags =
  let
    tagList = List.map (\name -> div [ class "tag" ] [ text name ]) foodTypes
  in
    div [ class "tags-list" ]
      [ div [ class "tags" ] tagList
      ]
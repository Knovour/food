module Components.Tags exposing (tags)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Event exposing (onClick)
import Msg.Main as Main exposing (..)
import Msg.Action exposing (..)
import Libs.Data exposing (foodTypes)
import Model.Action as Action


tags : Action.Model -> Html Main.Msg
tags action =
  let
    tagList = List.map (\name ->
      let
        classes =
          if name == action.tag then
            "tag current"
          else
            "tag"
      in
        div [ class classes, onClick (ActionMsg <| Tag name) ] [ text name ]
    ) foodTypes
  in
    div [ class "tags-list" ]
      [ div [ class "tags" ] tagList
      ]
module Components.Tags exposing (tags)

import Html exposing (Html, Attribute, div, text)
import Html.Attributes exposing (class)
import Html.Events as Event exposing (onClick)

import Msg.Main as Main exposing (..)
import Msg.Action exposing (..)

import Model.Action exposing (Model)

import Libs.Data exposing (foodTypes)

selected : String -> String -> Attribute Main.Msg
selected name tag =
  if (name == tag) then
    class "tag current"
  else
    class "tag"


tags : Model -> Html Main.Msg
tags { tag } =
  let
    tagList = List.map (\name ->
      div [ selected name tag, onClick (ActionMsg <| Tag name) ] [ text name ]
    ) foodTypes
  in
    div [ class "tags-block" ]
      [ div [ class "tags-list" ] tagList
      ]
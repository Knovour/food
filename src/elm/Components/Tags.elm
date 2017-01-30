module Components.Tags exposing (tags)
import Html exposing (Html, Attribute, div, text)
import Html.Attributes exposing (class)
import Html.Events as Event exposing (onClick)
import Dict exposing (Dict)

import Msg.Main as Main exposing (..)
import Msg.Action exposing (..)

import Model.Action exposing (Model)

import Libs.Type exposing (Food)
import Libs.Data exposing (foodTypes)
import Libs.Helpers exposing (getDictValue)

classes : Bool -> Bool -> Attribute Main.Msg
classes isCurrentTag noResult =
  let class1 = if isCurrentTag then " current" else ""
      class2 = if noResult then " _hide" else ""
  in  class ("tag" ++ class1 ++ class2)


tags : Model -> Dict String (List Food) -> Html Main.Msg
tags { group, tag } foodList =
  let toggle = if tag == "標籤" then " _hide" else ""
      tagList = List.map (\name ->
        let value = getDictValue name foodList
            click = (ActionMsg <| Group name)
        in div [ classes (name == group) ((List.length value) == 0), onClick click ] [ text name ]
      ) foodTypes
  in div [ class ("tags-block" ++ toggle) ] [ div [ class "tags-list" ] tagList ]

module Components.Action exposing (render)

import Html exposing (Html, div, i)
import Html.Attributes exposing (..)
import Html.Events as Event exposing (onClick)

import Msg.Main as Main exposing (..)
import Msg.Action exposing (..)
import Model.Action exposing (Model)

render : Model -> Html Main.Msg
render toggleAction =
  let
    actionClass = if toggleAction then "_depth-1 open" else "_depth-2 close"
    classes = "action-button -circle " ++ actionClass

    icon = if toggleAction then "close" else "magnify"
    iconClasses = "mdi mdi-" ++ icon ++ " icon"

    msg = if toggleAction then Close else Open
  in
    div [ class classes, onClick (ActionMsg <| msg) ] [ i [ class iconClasses ] [] ]

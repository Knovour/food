module Components.Dimmer exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events as Event exposing (onClick)
import Msg.Main as Main exposing (..)
import Msg.Box exposing (..)

show : Bool -> Html.Attribute msg
show isActive =
  let
    toggle =
      if isActive then
        "_show"
      else
        "_hide"
  in
    class ("dimmer " ++ toggle)


dimmer : List (Html.Attribute Main.Msg) -> Html Main.Msg
dimmer props =
  let
     attr = List.append props [ onClick (BoxMsg <| Close) ]
  in
    div attr []

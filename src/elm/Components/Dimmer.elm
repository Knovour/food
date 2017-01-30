module Components.Dimmer exposing (..)
import Html            exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events     exposing (onClick)

import Architecture.Main as Main exposing (..)
import Architecture.Box  exposing (..)



show : Bool -> Html.Attribute msg
show isActive =
  if isActive
  then class "dimmer _show"
  else class "dimmer _hide"


dimmer : List (Html.Attribute Main.Msg) -> Html Main.Msg
dimmer props =
  let attr = props ++ [ onClick (BoxMsg <| Close) ]
  in  div attr []

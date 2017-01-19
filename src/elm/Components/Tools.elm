module Components.Tools exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)

import Components.Tools.Display exposing (display)
import Components.Tools.Month as Month exposing (month)
import Components.Footer exposing (footer_)

import Msg.Main exposing (Msg)
import Model.Action as Action

tools : Action.Model -> Html Msg
tools action =
  div [ class "tools-pack" ]
    [ display
    , month action
    , footer_
    ]

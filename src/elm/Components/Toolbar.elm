module Components.Toolbar exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Event exposing (on, onInput)

import Libs.Normalize exposing (toInt)
import Msg.Main as Main exposing (..)
import Msg.Month as Month exposing (..)
import Model.Month as Month

render : Month.Model -> Html Main.Msg
render monthModel =
  div [ class "toolbar-block" ] [
    div [ class "month-range" ] [
      div [ class "group" ] [
        output [ class "output", for "monthRange" ] [ text monthModel.text ],
        input [
          id "monthRange",
          class "slider",
          type' "range",
          Attr.min "0",
          Attr.max "12",
          step "1",
          value (toString monthModel.current),
          name "monthRange",
          onInput (\value -> MonthMsg <| Change (toInt value))
        ] []
      ]
    ]
  ]

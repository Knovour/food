module Components.Toolbar exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Event exposing (onInput)

import Libs.Normalize exposing (toInt)
import Msg.Main as Main exposing (..)

import Msg.Month exposing (..)

import Model.Month as Month
import Model.Action as Action

render : Month.Model -> Action.Model -> Html Main.Msg
render monthModel isOpen =
  let
    formClass = if isOpen then "show" else "hide"
    classes = "toolbar-block _depth-2 " ++ formClass
  in
    Html.form [ class classes ]
    [ fieldset [ class "month" ] [ text monthModel.text ]
    , div [ class "month-range group" ]
      [ input
        [ id "monthRange"
        , class "slider"
        , type' "range"
        , Attr.min "0"
        , Attr.max "12"
        , step "1"
        , value (toString monthModel.current)
        , name "monthRange"
        , onInput (\value -> MonthMsg <| Change (toInt value))
        ] []
      ]
    -- , div [ class "group" ] [ input [type' "text" ] [] ]
    ]

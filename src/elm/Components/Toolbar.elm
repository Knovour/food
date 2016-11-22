module Components.Toolbar exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Html.Events as Event exposing (onInput)
import Libs.Normalize exposing (toInt)
import Msg.Main as Main exposing (..)
import Msg.Search exposing (..)
import Model.Search as Search
import Model.Action as Action


render : Search.Model -> Action.Model -> Html Main.Msg
render searchModel isOpen =
  let
    formClass =
      if isOpen then
        "show"
      else
        "hide"

    classes = "toolbar-block _depth-2 " ++ formClass
  in
    Html.form [ class classes ]
      [ fieldset [ class "month" ] [ text "搜尋" ]
      , div [ class "month-range group" ]
        [ label [ class "label" ] [ text searchModel.month ]
        , input
          [ id "monthRange"
          , class "slider"
          , type_ "range"
          , Attr.min "0"
          , Attr.max "12"
          , step "1"
          , value (toString searchModel.current)
          , name "monthRange"
          , onInput (\value -> SearchMsg <| Month (toInt value))
          ]
          []
        ]
      , div [ class "group" ]
        [ label [ class "label" ] [ text "名稱" ]
        , input
          [ type_ "text"
          , onInput (\value -> SearchMsg <| Name value)
          ]
          []
        ]
      ]

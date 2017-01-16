module Components.Tools.Tools exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)

import Components.Tools.Month as Month exposing (month)
import Msg.Main as Main exposing (..)


tools : Html Main.Msg
tools =
  let
    group1 = List.map (\num -> month [] [ Month.current num ]) (List.range 1 6)
    group2 = List.map (\num -> month [] [ Month.current num ]) (List.range 7 12)
  in
    div [ class "tools" ]
      [ div [ class "month-group" ]
          [ p [ class "heading" ] [ text "月份" ]
          , div [ class "group" ] group1
          , div [ class "group" ] group2
          ]
      ]
  -- Html.form [ class classes ]
  --   [ fieldset [ class "month" ] [ text "搜尋" ]
  --   , div [ class "month-range group" ]
  --     [ label [ class "label" ] [ text searchModel.month ]
  --     , input
  --       [ id "monthRange"
  --       , class "slider"
  --       , type_ "range"
  --       , Attr.min "0"
  --       , Attr.max "12"
  --       , step "1"
  --       , value (toString searchModel.current)
  --       , name "monthRange"
  --       , onInput (\value -> SearchMsg <| Month (toInt value))
  --       ]
  --       []
  --     ]
  --   , div [ class "group" ]
  --     [ label [ class "label" ] [ text "名稱" ]
  --     , input
  --       [ type_ "text"
  --       , onInput (\value -> SearchMsg <| Name value)
  --       ]
  --       []
  --     ]
  --   ]

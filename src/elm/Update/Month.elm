module Update.Month exposing (..)

import Msg.Main as Main exposing (..)
import Msg.Month as Month exposing (..)
import Model.Month exposing (Model)
import Libs.Data as Data


update : Main.Msg -> Model -> Model
update msg model =
  case msg of
    MonthMsg month_msg ->
      updateMonth month_msg

    _ ->
      model


updateMonth : Month.Msg -> Model
updateMonth month_msg =
  case month_msg of
    Change 0 ->
      { current = 0, text = "所有月份" }

    Change current ->
      let
        result =
          Data.month
            |> List.filter (\{ idx } -> idx == current)
            |> List.head
            |> Maybe.withDefault { idx = 0, eng = "", text = "所有月份" }
      in
        { current = current, text = result.text }

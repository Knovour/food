module Update.Month exposing (..)

import Msg.Main as Main exposing (..)
import Msg.Month as Month exposing (..)
import Model.Month exposing (Model)
import Libs.Data as Data


update : Main.Msg -> Model -> Model
update msg model =
  case msg of
    MonthMsg month_msg ->
      updateMonth month_msg model

    _ ->
      model


updateMonth : Month.Msg -> Model -> Model
updateMonth month_msg model =
  case month_msg of
    Change 0 ->
      { current = 0, text = "顯示全部" }

    Change current ->
      let
        result =
          Data.month
            |> List.filter (\{ idx } -> idx == current)
            |> List.head
            |> Maybe.withDefault { idx = 0, eng = "", text = "顯示全部" }
      in
        { current = current, text = result.text }

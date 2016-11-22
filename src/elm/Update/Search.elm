module Update.Search exposing (..)

import Msg.Main as Main exposing (..)
import Msg.Search as Search exposing (..)
import Model.Search exposing (Model)
import Libs.Data as Data


update : Main.Msg -> Model -> Model
update msg model =
  case msg of
    SearchMsg search_msg -> updateSearch search_msg model
    _ -> model


updateSearch : Search.Msg -> Model -> Model
updateSearch search_msg model =
  case search_msg of
    Month 0 -> { model | current = 0, month = "所有月份" }
    Month current ->
      let
        result =
          Data.month
            |> List.filter (\{ idx } -> idx == current)
            |> List.head
            |> Maybe.withDefault { idx = 0, eng = "", text = "所有月份" }
      in
        { model | current = current, month = result.text }

    Name str -> { model | name = str }

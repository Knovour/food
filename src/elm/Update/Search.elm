module Update.Search exposing (..)

import Msg.Main as Main exposing (..)
import Msg.Search as Search exposing (..)
import Model.Search exposing (Model)


update : Main.Msg -> Model -> Model
update msg model =
  case msg of
    SearchMsg search_msg -> updateSearch search_msg model
    _ -> model


updateSearch : Search.Msg -> Model -> Model
updateSearch search_msg model =
  case search_msg of
    SelectMonth num ->
      let newList = num :: model.month
      in { model | month = newList }

    UnSelectMonth num ->
      let newList = List.filter (\m -> m /= num) model.month
      in  { model | month = newList }

    Name str -> { model | name = str }

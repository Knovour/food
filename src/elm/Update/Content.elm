module Update.Content exposing (..)

import Libs.Normalize exposing (normalize)

import Msg.Main as Main exposing (..)
import Model.Content exposing (Model)


update : Main.Msg -> Model -> Model
update msg model =
  case msg of
    Content (Ok content) -> normalize content
    Content (Err _) -> []
    _ -> model
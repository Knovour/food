module Update.Action exposing (..)

import Msg.Main as Main exposing (..)
import Msg.Action as Action exposing (..)
import Model.Action exposing (Model)


update : Main.Msg -> Model -> Model
update msg model =
  case msg of
    ActionMsg action_msg -> toggleAction action_msg model
    _ -> model


toggleAction : Action.Msg -> Model -> Model
toggleAction action_msg model =
  case action_msg of
    Hover list -> { model | hover = list }
    Group str -> { model | group = str }
    Layout str -> { model | layout = str }
    Tag str -> { model | tag = str }

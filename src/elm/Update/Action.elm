module Update.Action exposing (..)

import Msg.Main as Main exposing (..)
import Msg.Action as Action exposing (..)
import Model.Action exposing (Model)


update : Main.Msg -> Model -> Model
update msg model =
  case msg of
    ActionMsg action_msg ->
      toggleAction action_msg

    _ ->
      model


toggleAction : Action.Msg -> Model
toggleAction action_msg =
  case action_msg of
    Open -> True
    Close -> False

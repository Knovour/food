module Update.Box exposing (..)

import Msg.Main as Main exposing (..)
import Msg.Box as Box exposing (..)
import Model.Box exposing (Model)


update : Main.Msg -> Model -> Model
update msg model =
  case msg of
    BoxMsg box_msg ->
      toggleBox box_msg model

    _ ->
      model


toggleBox : Box.Msg -> Model -> Model
toggleBox box_msg model =
  case box_msg of
    Open str ->
      { open = True, food = str }

    Close ->
      { open = False, food = "" }

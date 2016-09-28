import Html exposing (..)
import Html.App as Html

import Libs.Data exposing (data)

import Msg.Main exposing (Msg)
import Model.Main as Main exposing (Model, model)
import Update.Main exposing (update)

import Components.Header as Header
import Components.Shelf as Shelf
import Components.Toolbar as Toolbar
import Components.Footer as Footer

-- APP
main : Program Never
main =
  Html.beginnerProgram {
    model = model,
    view = view,
    update = update
  }


-- VIEW

view : Model -> Html Msg
view model =
  let
    month = model.month
  in
    div [] [
      Header.render,
      Toolbar.render month,
      Shelf.render [] (Shelf.goods data month),
      Footer.render
    ]

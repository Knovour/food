module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Libs.Data exposing (data)
import Msg.Main exposing (Msg)
import Model.Main as Main exposing (Model, model)
import Update.Main exposing (update)

import Components.Dimmer as Dimmer
import Components.Header as Header
import Components.Shelf as Shelf
import Components.Toolbar as Toolbar
import Components.Action as Action
import Components.Footer as Footer
import Components.Box as Box


-- APP


main : Program Never
main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- VIEW


view : Model -> Html Msg
view model =
  let
    month = model.month
    box = model.box
    action = model.action
  in
    div []
      [ Dimmer.render box.open
      , Header.render
      , Shelf.render [] (Shelf.goods data month)
      , Footer.render
      , Box.render box
      , Toolbar.render month action
      , Action.render action
      ]

import Html exposing (Html, div)

import Libs.Init exposing (request)

import Msg.Main as Main exposing (..)

import Model.Main as Main exposing (Model, model)

import Update.Main exposing (update)

import Components.Header  as Header
import Components.Tags as Tags exposing (tags)
import Components.Shelf as Shelf
import Components.Tools.Tools as Tools exposing (tools)



-- APP

main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- INIT

init : (Model, Cmd Msg)
init = (model, request)



-- VIEW

view : Model -> Html Msg
view model =
  let
    search = model.search
    box = model.box
    action = model.action
    content = model.content
  in
    div []
      [ Header.render
      , tools action
      , tags action
      , Shelf.render [] (Shelf.goods action content search)
      ]



-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

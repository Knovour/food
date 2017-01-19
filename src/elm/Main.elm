import Html exposing (Html, div)

import Libs.Init exposing (request)

import Msg.Main exposing (Msg)

import Model.Main exposing (Model, model)

import Update.Main exposing (update)

import Components.Header as Header exposing (header_)
import Components.Tags as Tags exposing (tags)
import Components.Shelf as Shelf exposing (shelf)
import Components.Tools as Tools exposing (tools)



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
view { search, box, action, content } =
  div []
    [ header_
    , tools action
    , tags action
    , shelf [] (Shelf.layer_ action content search)
    ]



-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

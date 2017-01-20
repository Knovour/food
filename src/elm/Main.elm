import Html exposing (Html, div)

import Libs.Init exposing (request)

import Msg.Main exposing (Msg)

import Model.Main exposing (Model, model)

import Update.Main exposing (update)

import Components.Dimmer as Dimmer exposing (dimmer)
import Components.Header as Header exposing (header_)
import Components.Tags exposing (tags)
import Components.Shelf as Shelf exposing (shelf)
import Components.Tools exposing (tools)
import Components.Box exposing (box_)



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
    , tools action search
    , tags action
    , shelf [] (Shelf.layer_ action content search)
    , dimmer [ Dimmer.show box.open ]
    , box_ box
    ]



-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

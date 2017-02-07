module Main exposing (..)
import Html exposing (Html, div)

import Architecture.Main   exposing (..)
import Components.Dimmer  as Dimmer exposing (dimmer)
import Components.Header  exposing (header_)
import Components.Content exposing (content)
import Components.Tools   exposing (tools)
import Components.Box     exposing (box)
import Libs.Init exposing (request, screenSize)



-- APP

main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = screenSize
    }



-- INIT

init : (Model, Cmd Msg)
init = (model, request)



-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ header_ model
    , tools model
    , content model
    , dimmer model
    , box model.box
    ]

module Main exposing (..)
import Html exposing (Html, div)

import Components.Dimmer  as Dimmer exposing (dimmer)
import Components.Header  exposing (header_)
import Components.Content exposing (content)
import Components.Tools   exposing (tools)
import Components.Box     exposing (box_)
import Architecture.Main exposing (..)
import Libs.Init exposing (request)



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
  div []
    [ header_ model.search.name
    , tools model.action model.search
    , content model
    , dimmer [ Dimmer.show model.box.open ]
    , box_ model.box
    ]



-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

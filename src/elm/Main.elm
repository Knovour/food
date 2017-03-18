module Main exposing (..)
import Html exposing (Html, div, main_)

import Architecture.Main exposing (..)
import Components.Dimmer  as Dimmer exposing (dimmer)
import Components.Header  exposing (header_)
import Components.Tabs    exposing (tabs)
import Components.Content exposing (content)
import Components.Tools   exposing (tools)
import Components.Box     exposing (box)
import Components.Action  exposing (action)
import Libs.Init exposing (cmd, subscriptions)
import Libs.Helpers exposing (foodRefilter)



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
init = (model, cmd)



-- VIEW

view : Model -> Html Msg
view model =
  let foodDict = foodRefilter model.action model.search model.content
  in
    div []
      [ main_ []
        [ header_ model
        , tools model
        , tabs model.action foodDict
        , content model foodDict
        ]
      , dimmer model.box
      , box model.box
      , action model
      ]

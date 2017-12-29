module Main exposing (..)
import Html exposing (Html, div, main_)
import Html.Attributes exposing (classList)
import Navigation exposing (Location)

import Routing exposing (Route, fromLocation, parseLocation)

import Architecture.Main exposing (..)
import Components.Dimmer  as Dimmer exposing (dimmer)
import Components.Header  exposing (header_)
import Components.Tabs    exposing (tabs)
import Components.Content exposing (content)
import Components.Tools   exposing (tools)
import Components.InfoBox exposing (infoBox)
import Components.Action  exposing (action)
import Components.Footer  exposing (footer_)
import Libs.Init exposing (cmd, subscriptions)
import Libs.Helpers exposing (foodRefilter)



-- APP

main : Program Never Model Msg
main =
  Navigation.program (fromLocation >> OnLocationChange)
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }



-- INIT

init : Location -> (Model, Cmd Msg)
init location =
  let currentRoute = parseLocation location
  in (initialModel currentRoute, cmd)



-- VIEW

view : Model -> Html Msg
view model =
  let foodDict = foodRefilter model.action model.filter model.content
      classes =
        classList
        [ ("main-block", True)
        , ("-extend", (not model.action.toggleSidebar && model.screen.width > 976))
        ]
  in
    div []
      [ main_ [ classes ]
        [ header_ model
        , tools model
        , tabs model.action foodDict
        , content model foodDict
        , footer_
        ]
      , dimmer model.box
      , infoBox model.box
      , action model.action model.filter
      ]

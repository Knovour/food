module Main exposing (init, main, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (div, main_)
import Html.Attributes exposing (classList)
import Url exposing (Url)

import Architecture.Main exposing (..)
import Components.Action exposing (action)
import Components.Content exposing (content)
import Components.Dimmer exposing (dimmer)
import Components.Footer exposing (footer_)
import Components.Header exposing (header_)
import Components.InfoBox exposing (infoBox)
import Components.Tabs exposing (tabs)
import Components.Tools exposing (tools)
import Libs.Helpers exposing (foodRefilter)
import Libs.Init exposing (cmd, subscriptions)
import Route


-- APP


main : Program () Model Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }



-- INIT

init : () -> Url -> Nav.Key -> (Model, Cmd Msg)
init _ url key =
  (initialModel url key, cmd (Route.getRouteTarget (Route.match url)))



-- VIEW


view : Model -> Browser.Document Msg
view model =
  let foodDict = foodRefilter model.filter model.content

      classes =
        classList
          [ ("main-block", True)
          , ("-extend", not model.action.toggleSidebar && model.screen.width > 976)
          ]
  in
    { title = "當季蔬果一覽"
    , body =
      [ div []
        [ main_ [ classes ]
          [ header_ model
          , tools model
          , tabs model.action
          , content model foodDict
          , footer_
          ]
        , dimmer model.box
        , infoBox model.box
        , action model.action model.filter
        ]
      ]
    }

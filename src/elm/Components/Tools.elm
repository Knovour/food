module Components.Tools exposing (..)
import Html            exposing (Html, div, i, text)
import Html.Attributes exposing (class, classList)

import Architecture.Main as Main exposing (..)
import Components.Tools.Display exposing (display)
import Components.Tools.Month   exposing (month)
import Components.Footer        exposing (footer_)



tools : Main.Model -> Html Main.Msg
tools model =
  let { action, screen } = model
      isMobile = screen.width <= 976
      isSideBarClose = action.sidebar == "close"
      classes =
        classList
          [ ("tools-sidebar", True)
          , ("-narrow", (isSideBarClose && isMobile /= True))
          , ("_float", isMobile)
          , ("_hide", (isMobile && isSideBarClose))
          ]
  in
    div [ classes ]
      [ display action
      , month action model.search
      , footer_
      ]

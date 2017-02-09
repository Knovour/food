module Components.Tools exposing (..)
import Html            exposing (Html, div, i, text)
import Html.Attributes exposing (class)

import Architecture.Main as Main exposing (..)
import Components.Tools.Display   exposing (display)
import Components.Tools.Month     exposing (month)
import Components.Footer          exposing (footer_)



tools : Main.Model -> Html Main.Msg
tools model =
  let
    { action, screen } = model
    isMobile = screen.width <= 976
    classes =
      if (action.sidebar == "close" && isMobile /= True)
      then " -narrow"
      else ""
    mobileClasses =
      if isMobile
      then " _float"
      else ""
    toggleClasses =
      if isMobile && action.sidebar == "close"
      then " _hide"
      else ""
  in
    div [ class ("tools-sidebar" ++ classes ++ mobileClasses ++ toggleClasses) ]
      [ display action
      , month action model.search
      , footer_
      ]

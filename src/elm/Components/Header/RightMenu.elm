module Components.Header.RightMenu exposing (rightMenu)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Architecture.Action as Action exposing (..)
import Architecture.Box exposing (..)
import Architecture.Main as Main exposing (..)
import Elements.Icon exposing (icon)


rightMenu : Action.Model -> Html Main.Msg
rightMenu { toggleSidebar } =
  let arrowIcon =
        if toggleSidebar
        then "keyboard_arrow_right"
        else "keyboard_arrow_left"
  in
    div [ class "right-menu" ]
      [ div [ class "btn info-btn -circle", onClick (Box Open) ] [ icon "priority_high" ]
      , div [ class "btn tools-btn", onClick (Action ToggleSidebar) ] [ icon arrowIcon ]
      ]

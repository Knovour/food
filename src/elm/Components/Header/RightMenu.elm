module Components.Header.RightMenu exposing (..)
import Html            exposing (Html, div, text, i)
import Html.Attributes exposing (class)
import Html.Events     exposing (onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Box    exposing (..)
import Architecture.Action exposing (..)



rightMenu : Main.Model -> Html Main.Msg
rightMenu { action, screen } =
  let
    sidebarIsOpen = action.sidebar == "open"
    toggleSidebar =
      if sidebarIsOpen
      then Action <| Sidebar "close"
      else Action <| Sidebar "open"
    toolIcon =
      if screen.width <= 976
      then "more_vert"
      else if sidebarIsOpen
      then "keyboard_arrow_right"
      else "keyboard_arrow_left"
    searchIcon =
      if action.toggleSearch == "open"
      then "close"
      else "search"
    toggleSearch =
      if action.toggleSearch == "open"
      then Action <| ToggleSearch "close"
      else Action <| ToggleSearch "open"
  in
    div [ class "right-menu" ]
      [ div [ class "btn info-btn -circle", onClick (Box <| Open "info") ] [ i [ class "material-icons icon" ] [ text "priority_high" ] ]
      , div [ class "btn tools-btn", onClick toggleSidebar ] [ i [ class "material-icons icon" ] [ text toolIcon ] ]
      ]

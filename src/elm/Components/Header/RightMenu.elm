module Components.Header.RightMenu exposing (..)
import Html            exposing (Html, div, text, i)
import Html.Attributes exposing (class)
import Html.Events     exposing (onClick)

import Architecture.Main   as Main exposing (..)
import Architecture.Box    exposing (..)
import Architecture.Action as Action exposing (..)



rightMenu : Action.Model -> Html Main.Msg
rightMenu { toggleSidebar } =
  let direction = if toggleSidebar then "right" else "left"
      arrowIcon = "keyboard_arrow_" ++ direction
  in
    div [ class "right-menu" ]
      [ div [ class "btn info-btn -circle", onClick (Box <| Open "info") ]
        [ i [ class "material-icons icon" ] [ text "priority_high" ]
        ]
      , div [ class "btn tools-btn", onClick (Action ToggleSidebar) ]
        [ i [ class "material-icons icon" ] [ text arrowIcon ]
        ]
      ]

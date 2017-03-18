module Components.Header exposing (header_)
import Html            exposing (Html, header, img, div)
import Html.Attributes exposing (class, classList, src, alt)

import Architecture.Main as Main exposing (..)
import Components.Header.Search    exposing (search)
import Components.Header.RightMenu exposing (rightMenu)



header_ : Model -> Html Main.Msg
header_ model =
  let { action, screen } = model
      classes =
        classList
          [ ("header-block", True)
          , ("-extend", (not action.toggleSidebar && screen.width > 976))
          ]
  in
    header [ classes ]
      [ div [ class "main-nav" ]
        [ img [ class "logo", src "https://images.contentful.com/8whbhu195nq1/XEjhAcjLqgkisASyao8KY/dae01c7a3be79d16a89f533249cf05b3/logo.svg", alt "logo" ] []
        , search model.search
        , rightMenu model.action
        ]
      ]

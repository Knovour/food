module Components.Footer exposing (footer_)

import Html exposing (Html, div, footer, span, text, a, i)
import Html.Attributes exposing (class, href, target)


middot : Html msg
middot = span [ class "middot" ] [ text "·" ]

footer_ : Html msg
footer_ =
  let blog = "https://notes.knovour.ninja"
      github = "https://github.com/Knovour/food"
      elm = "http://elm-lang.org"
  in
    footer [ class "footer" ]
      [ div [ class "copyright" ] [ text "2017 © Knovour" ]
      , div [ class "links" ]
        [ a [ href blog, target "_blank" ] [ text "Blog" ]
        , middot
        , a [ href github, target "_blank" ] [ text "GitHub" ]
        , middot
        , span []
          [ text "Made by "
          , a [ href elm, target "_blank" ] [ text "Elm" ]
          ]
        ]
      ]

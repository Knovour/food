module Components.Footer exposing (footer_)
import Html            exposing (Html, div, footer, span, text, a, i)
import Html.Attributes exposing (class, href, target)

import Components.Link exposing (link)



footer_ : Html msg
footer_ =
  let blog = "https://notes.knovour.ninja"
      github = "https://github.com/Knovour/food"
      elm = "http://elm-lang.org"
  in
    footer [ class "footer" ]
      [ div [ class "copyright" ] [ text "2017 © Knovour" ]
      , div [ class "links" ]
        [ link blog "Blog"
        , middot
        , link github "GitHub"
        , middot
        , span [] [ text "Made by ", link elm "Elm" ]
        ]
      ]


middot : Html msg
middot = span [ class "middot" ] [ text "·" ]

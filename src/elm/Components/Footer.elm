module Components.Footer exposing (footer_)

import Html exposing (Html, a, div, footer, i, span, text)
import Html.Attributes exposing (class, href, target)

import Elements.Link exposing (link)
import Elements.Middot exposing (middot)



-- Component


footer_ : Html msg
footer_ =
  let blog = "https://notes.knovour.ninja"
      github = "https://github.com/Knovour/food"
      elm = "http://elm-lang.org"
  in
    footer [ class "footer" ]
      [ div [ class "copyright" ] [ text "2019 © SiFi 矽緋國際" ]
      , div [ class "links" ]
        [ link blog "Blog"
        , middot
        , link github "GitHub"
        , middot
        , span [] [ text "Made by ", link elm "Elm" ]
        ]
      ]

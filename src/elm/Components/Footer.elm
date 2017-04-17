module Components.Footer exposing (footer_)
import Html            exposing (Html, div, footer, span, text, a, i)
import Html.Attributes exposing (class, href, target)

import Elements.Link exposing (link)
import Elements.Middot exposing (middot)



-- Data

info : { blog : String, github : String, elm : String }
info =
  { blog   = "https://notes.knovour.ninja"
  , github = "https://github.com/Knovour/food"
  , elm    = "http://elm-lang.org"
  }



-- Component

footer_ : Html msg
footer_ =
  footer [ class "footer" ]
    [ div [ class "copyright" ] [ text "2017 © Knovour" ]
    , div [ class "links" ]
      [ link info.blog "Blog"
      , middot
      , link info.github "GitHub"
      , middot
      , span [] [ text "Made by ", link info.elm "Elm" ]
      ]
    ]

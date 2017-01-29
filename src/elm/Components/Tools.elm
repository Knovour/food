module Components.Tools exposing (..)
import Html exposing (Html, div)
import Html.Attributes exposing (class)

import Components.Tools.Display exposing (display)
import Components.Tools.Month as Month exposing (month)
import Components.Footer exposing (footer_)

import Msg.Main exposing (Msg)
import Model.Action as Action
import Model.Search as Search


tools : Action.Model -> Search.Model -> Html Msg
tools action search =
  div [ class "tools-pack" ]
    [ display action
    , month action search
    , footer_
    ]

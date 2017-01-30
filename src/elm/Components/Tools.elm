module Components.Tools exposing (..)
import Html            exposing (Html, div)
import Html.Attributes exposing (class)

import Architecture.Main   exposing (Msg)
import Architecture.Action as Action
import Architecture.Search as Search
import Components.Tools.Display exposing (display)
import Components.Tools.Month   exposing (month)
import Components.Footer exposing (footer_)



tools : Action.Model -> Search.Model -> Html Msg
tools action search =
  div [ class "tools-pack" ]
    [ display action
    , month action search
    , footer_
    ]

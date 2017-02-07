module Components.Tools.SearchBox exposing (..)
import Html            exposing (Html, div)
import Html.Attributes exposing (class)

import Architecture.Main as Main exposing (..)
import Components.Header.Search exposing (search)



searchBox : String -> Html Main.Msg
searchBox searchVal =
  div [ class "options-block search-box" ]
    [ search searchVal
    ]

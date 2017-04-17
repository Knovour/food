module Libs.Init exposing (..)
import Http
import Task
import Window

import Architecture.Main   as Main exposing (..)
import Architecture.Screen exposing (..)
import Libs.Parser exposing (parser)



contentUrl : String
contentUrl = "https://cdn.contentful.com/spaces/8whbhu195nq1/entries?access_token=2f74c3147a60b6f114c06133d0badf43b7e2415284385a7dd94def6812e3bb4a"


-- INIT

cmd : Cmd Main.Msg
cmd =
  Cmd.batch
    [ Http.send Content (Http.get contentUrl parser)
    , Task.perform (\w -> Screen <| Width w) Window.width
    ]



-- SUBSCRIPTIONS

subscriptions : Main.Model -> Sub Main.Msg
subscriptions model =
  Window.resizes (\{ width } -> Screen <| Width width)

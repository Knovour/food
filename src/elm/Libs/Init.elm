module Libs.Init exposing (cmd, subscriptions)

import Time as Time
import Libs.Graphcool exposing (generateQueryRequest)
import Task
import Browser.Dom as Dom
import Browser.Events exposing (onResize)

import Architecture.Filter exposing (..)
import Architecture.Main as Main exposing (..)
import Architecture.Screen exposing (..)

toNumberMonth : Time.Month -> Int
toNumberMonth month =
  case month of
    Time.Jan -> 0
    Time.Feb -> 1
    Time.Mar -> 2
    Time.Apr -> 3
    Time.May -> 4
    Time.Jun -> 5
    Time.Jul -> 6
    Time.Aug -> 7
    Time.Sep -> 8
    Time.Oct -> 9
    Time.Nov -> 10
    Time.Dec -> 11


-- INIT


cmd : String -> Cmd Main.Msg
cmd location =
  let target =
        if String.isEmpty location
        then "vegetables"
        else location
  in
    Cmd.batch
      [ Task.attempt Content (generateQueryRequest target)
      , Task.perform (\{ viewport } -> Screen <| Width (Basics.round viewport.width)) Dom.getViewport
      , Task.perform (Filter << Now << toNumberMonth) (Task.map2 Time.toMonth Time.here Time.now)
      ]

-- SUBSCRIPTIONS


subscriptions : Main.Model -> Sub Main.Msg
subscriptions _ = onResize (\width _ -> Screen <| Width width)

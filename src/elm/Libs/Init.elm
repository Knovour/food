module Libs.Init exposing (..)
import Task
import Window
import Date
import Date.Extra exposing (monthNumber)

import Architecture.Main   as Main exposing (..)
import Architecture.Screen exposing (..)
import Architecture.Filter exposing (..)
import Libs.Graphcool exposing (generateQueryRequest)



-- INIT

cmd : String -> Cmd Main.Msg
cmd location =
  let group = String.dropLeft 2 location
      target =
        if String.isEmpty group
        then "vegetables"
        else group
  in
    Cmd.batch
      [ Task.attempt Content (generateQueryRequest target)
      , Task.perform (Screen << Width) Window.width
      , Task.perform (Filter << Now << monthNumber) Date.now
      ]



-- SUBSCRIPTIONS

subscriptions : Main.Model -> Sub Main.Msg
subscriptions model =
  Window.resizes (\{ width } -> Screen <| Width width)

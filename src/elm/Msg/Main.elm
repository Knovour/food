module Msg.Main exposing (..)

import Http

import Msg.Search as Search
import Msg.Box as Box
import Msg.Action as Action

import Libs.Type exposing (Respond)

type Msg
  = NoOp
  | SearchMsg Search.Msg
  | BoxMsg Box.Msg
  | ActionMsg Action.Msg
  | Content (Result Http.Error Respond)

module Msg.Main exposing (..)

import Msg.Month as Month
import Msg.Box as Box
import Msg.Action as Action


type Msg
  = NoOp
  | MonthMsg Month.Msg
  | BoxMsg Box.Msg
  | ActionMsg Action.Msg

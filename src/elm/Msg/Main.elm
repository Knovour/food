module Msg.Main exposing (..)

import Msg.Month as Month
import Msg.Box as Box


type Msg
  = NoOp
  | MonthMsg Month.Msg
  | BoxMsg Box.Msg

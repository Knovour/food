module Msg.Main exposing (..)

import Msg.Month as Month

type Msg
    = NoOp
    | MonthMsg Month.Msg
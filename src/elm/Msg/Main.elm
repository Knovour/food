module Msg.Main exposing (..)

import Msg.Search as Search
import Msg.Box as Box
import Msg.Action as Action


type Msg
  = NoOp
  | SearchMsg Search.Msg
  | BoxMsg Box.Msg
  | ActionMsg Action.Msg

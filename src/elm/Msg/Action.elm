module Msg.Action exposing (..)


type Msg
  = Hover (List Int)
  | Group String
  | Layout String
  | Tag String

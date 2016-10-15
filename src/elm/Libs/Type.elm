module Libs.Type exposing (..)


type alias Food =
  { name : String
  , url : String
  , imgFrom : String
  , species : String
  , harvest : List Int
  }


type alias Month =
  { idx : Int
  , eng : String
  , text : String
  }

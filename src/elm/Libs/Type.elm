module Libs.Type exposing (..)


type alias Month =
  { idx : Int
  , eng : String
  , text : String
  }


type alias Item =
  { name : String
  , image : String
  , species : String
  , harvest : List String
  }


type alias Asset =
  { id : String
  , url: String
  , source : String
  }


type alias Respond =
  { items: List Item
  , assets: List Asset
  }


type alias Food =
  { name : String
  , image : String
  , source : String
  , species : String
  , harvest : List Int
  }


type alias Group =
  { tag : String
  , list : List Food
  }

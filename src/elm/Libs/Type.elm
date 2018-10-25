module Libs.Type exposing (Asset, Food, FoodGroup, FoodType, Item, Respond)


type alias Item =
  { name : String
  , image : String
  , species : String
  , harvest : List String
  }


type alias Asset =
  { id : String
  , url : String
  , source : String
  }


type alias Food =
  { name : String
  , image : String
  , harvest : List Int
  }


type alias FoodGroup =
  { enName : String
  , foods : List Food
  }


type alias Respond =
  List FoodGroup


type alias FoodType =
  { name : String
  , enName : String
  }

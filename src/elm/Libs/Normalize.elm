module Libs.Normalize exposing (normalize, toInt)

import String
import List
import Libs.Type exposing (Food, Month)


pick : String -> List Food -> List Food
pick currentType list =
  List.filter (\{ species } -> species == currentType) list


format : String -> List Food -> { currentType : String, list : List Food }
format currentType list =
  { currentType = currentType
  , list = list
  }


normalize :
  List Food
  -> List String
  -> List
    { currentType : String
    , list : List Food
    }
normalize rowData foodTypes =
  List.map
    (\currentType ->
      rowData
        |> pick currentType
        |> format currentType
    )
    foodTypes


toInt : String -> Int
toInt value =
  Result.withDefault 0 (String.toInt value)

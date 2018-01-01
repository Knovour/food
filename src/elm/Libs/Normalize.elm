module Libs.Normalize exposing (normalize)

import Libs.Type exposing (Food)



normalize : List Food -> List Food
normalize foodData =
  foodData
    |> List.sortBy (\{ harvest } -> List.length harvest)
    |> List.reverse

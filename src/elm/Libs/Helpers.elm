module Libs.Helpers exposing (foodRefilter, getDictValue)

import Dict exposing (Dict)

import Architecture.Filter as Filter
import Libs.Type exposing (Food)


foodRefilter : Filter.Model -> Dict String (List Food) -> Dict String (List Food)
foodRefilter filter content =
  Dict.map
    (\_ value ->
      List.filter
        (\{ name, harvest } ->
          let isSearchResult =
                String.isEmpty filter.name || String.contains filter.name name

              isFilterResult =
                List.isEmpty filter.month || isFilterHarvest harvest filter.month
          in isSearchResult && isFilterResult
        )
        value
    ) content


isFilterHarvest : List Int -> List Int -> Bool
isFilterHarvest harvest selectedMonth =
  (List.length selectedMonth <= List.length harvest) &&
  (selectedMonth
    |> List.filter (\num -> List.member num harvest)
    |> List.length
    |> (==) (List.length selectedMonth)
  )


getDictValue : String -> Dict String (List Food) -> List Food
getDictValue key dict =
  dict
    |> Dict.get key
    |> Maybe.withDefault []

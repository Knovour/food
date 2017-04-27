module Libs.Helpers exposing (foodRefilter, getDictValue)
import Dict exposing (Dict)

import Architecture.Filter as Filter
import Architecture.Action as Action
import Libs.Type exposing (Food)



foodRefilter : Action.Model -> Filter.Model -> Dict String (List Food) -> Dict String (List Food)
foodRefilter action filter content =
  Dict.map (\key value ->
    List.filter (\{ name, harvest } ->
      let isSearchResult = String.isEmpty filter.name || String.contains filter.name name
          isFilterResult = List.isEmpty filter.month || isFilterHarvest harvest filter.month
      in (isSearchResult && isFilterResult)
    ) value
  ) content


isFilterHarvest : List Int -> List Int -> Bool
isFilterHarvest harvest selectedMonth =
  (&&)
    (List.length selectedMonth <= List.length harvest)
    (selectedMonth
      |> List.filter (\num -> List.member num harvest)
      |> List.length
      |> (==) (List.length selectedMonth))


getDictValue : Dict String (List Food) -> String -> List Food
getDictValue dict key =
  dict
    |> Dict.get key
    |> Maybe.withDefault []

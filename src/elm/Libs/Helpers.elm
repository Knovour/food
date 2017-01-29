module Libs.Helpers exposing (foodRefilter, getDictValue)
import Dict exposing (Dict)

import Model.Search as Search
import Model.Action as Action

import Libs.Type exposing (Food)



foodRefilter : Action.Model -> Search.Model -> Dict String (List Food) -> Dict String (List Food)
foodRefilter action search content =
  Dict.map (\key value ->
    List.filter (\{ name, harvest } ->
      let
        isSearchResult = String.isEmpty search.name || (String.contains search.name name)
        isFilterResult = List.isEmpty search.month || (isFilterHarvest harvest search.month)
      in
        (isSearchResult && isFilterResult)
    ) value
  ) content


isFilterHarvest : List Int -> List Int -> Bool
isFilterHarvest harvest selectedMonth =
  let
    result =
      if (List.length selectedMonth) > (List.length harvest) then
        -1
      else
        selectedMonth
          |> List.filter (\num -> List.member num harvest)
          |> List.length
  in
    (List.length selectedMonth) == result


getDictValue : String -> Dict String (List Food) -> List Food
getDictValue key dict =
  dict
    |> Dict.get key
    |> Maybe.withDefault []

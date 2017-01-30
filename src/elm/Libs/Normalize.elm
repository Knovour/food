module Libs.Normalize exposing (normalize, toInt)
import Dict exposing (Dict)

import Libs.Data exposing (foodTypes)
import Libs.Type exposing (Respond, Item, Asset, Food, Group)



normalize : Respond -> Dict String (List Food)
normalize { items, assets } =
  let rowData = List.map (\item -> insert item assets) items
  in foodTypes
      |> List.map (\tag ->
          let list =
                rowData
                  |> List.filter (\{ species } -> species == tag)
                  |> List.sortBy (\{ harvest } -> List.length harvest)
                  |> List.reverse
          in (tag, list)
        )
      |> Dict.fromList


insert : Item -> List Asset -> Food
insert item assets =
  let result =
        assets
          |> List.filter (\{ id } -> id == item.image)
          |> List.head
          |> Maybe.withDefault { id = "", url = "", source = "" }
  in
    { name = item.name
    , image = result.url
    , source = result.source
    , species = item.species
    , harvest = (List.map toInt item.harvest)
    }


toInt : String -> Int
toInt value = Result.withDefault 0 (String.toInt value)

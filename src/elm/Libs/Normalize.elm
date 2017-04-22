module Libs.Normalize exposing (normalize)
import Dict exposing (Dict)

import Libs.Data exposing (foodTypes)
import Libs.Type exposing (Respond, Item, Asset, Food)



normalize : Respond -> Dict String (List Food)
normalize { items, assets } =
  let rowData = List.map (insert assets) items
  in foodTypes
      |> List.map (toFoodListTuple rowData)
      |> Dict.fromList


insert : List Asset -> Item -> Food
insert assets item =
  let { url, source } =
        assets
          |> List.filter (\{ id } -> id == item.image)
          |> List.head
          |> Maybe.withDefault { id = "", url = "", source = "" }
      harvest = List.map (Result.withDefault 0 << String.toInt) item.harvest
  in
    { name    = item.name
    , image   = url
    , source  = source
    , species = item.species
    , harvest = harvest
    }


toFoodListTuple : List Food -> String -> (String, List Food)
toFoodListTuple rowData tag =
  rowData
    |> List.filter (\{ species } -> species == tag)
    |> List.sortBy (\{ harvest } -> List.length harvest)
    |> List.reverse
    |> (,) tag

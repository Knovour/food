module Libs.Normalize exposing (normalize, toInt)

import Libs.Data exposing (foodTypes)
import Libs.Type exposing (Respond, Item, Asset, Food, Group)


normalize : Respond -> List Group
normalize { items, assets } =
  let
    rowData = List.map (\item -> insert item assets) items
  in
    List.map (\tag ->
      rowData
        |> pick tag
        |> List.sortBy (\{ harvest } -> List.length harvest)
        |> List.reverse
        |> groupUp tag
    ) foodTypes


insert : Item -> List Asset -> Food
insert item assets =
  let
    result =
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


pick : String -> List Food -> List Food
pick tag list =
  List.filter (\{ species } -> species == tag) list


groupUp : String -> List Food -> { tag : String, list : List Food }
groupUp tag list =
  { tag = tag
  , list = list
  }


toInt : String -> Int
toInt value =
  Result.withDefault 0 (String.toInt value)

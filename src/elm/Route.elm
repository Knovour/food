module Route exposing (Route(..), getRouteTarget, match)

import Browser.Navigation as Nav
import Url exposing (Url)
import Url.Parser exposing ((</>), Parser, map, oneOf, s, string, top, parse)


type Route
  = Vegetable
  | RootVegetable
  | Bean
  | Mushroom
  | Cereal
  | Fruit
  | NotFound


match : Url -> Route
match =
  let path = oneOf
        [ map Vegetable top
        , map Vegetable (s "vegetables")
        , map RootVegetable (s "root-vegetables")
        , map Bean (s "beans")
        , map Mushroom (s "mushrooms")
        , map Cereal (s "cereals")
        , map Fruit (s "fruits")
        ]
  in parse path >> Maybe.withDefault Vegetable

getRouteTarget : Route -> String
getRouteTarget routeMsg =
  case routeMsg of
    Vegetable -> "vegetables"
    RootVegetable -> "root-vegetables"
    Bean -> "beans"
    Mushroom -> "mushrooms"
    Cereal -> "cereals"
    Fruit -> "fruits"
    NotFound -> "vegetables"

module Routing exposing (..)
import Navigation exposing (Location)
import UrlParser exposing ((</>), Parser, map, top, oneOf, parseHash, s, string)



type Route
  = VegetableRoute
  | RootVegetableRoute
  | BeanRoute
  | MushroomRoute
  | CerealRoute
  | FruitRoute
  | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ map VegetableRoute top
    , map VegetableRoute (s "vegetable")
    , map RootVegetableRoute (s "root-vegetable")
    , map BeanRoute (s "bean")
    , map MushroomRoute (s "mushroom")
    , map CerealRoute (s "cereal")
    , map FruitRoute (s "fruit")
    ]


parseLocation : Location -> Route
parseLocation location =
  case (parseHash matchers location) of
    Just route -> route
    Nothing -> NotFoundRoute

fromLocation : Location -> Maybe Route
fromLocation location =
  if String.isEmpty location.hash
  then Just VegetableRoute
  else parseHash matchers location

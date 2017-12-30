module Libs.Data exposing (..)

import Libs.Type exposing (FoodType)


foodTypes : List FoodType
foodTypes =
  [ { name = "蔬菜", enName = "vegetables" }
  , { name = "根莖類", enName = "root-vegetables" }
  , { name = "豆類", enName = "beans" }
  , { name = "菇類", enName = "mushrooms" }
  , { name = "穀類", enName = "cereals" }
  , { name = "水果", enName = "fruits" }
  ]

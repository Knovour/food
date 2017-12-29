module Libs.Data exposing (..)

import Libs.Type exposing (FoodType)


foodTypes : List FoodType
foodTypes =
  [ { name = "蔬菜", enName = "vegetable" }
  , { name = "根莖類", enName = "root-vegetable" }
  , { name = "豆類", enName = "bean" }
  , { name = "菇類", enName = "mushroom" }
  , { name = "穀類", enName = "cereal" }
  , { name = "水果", enName = "fruit" }
  ]

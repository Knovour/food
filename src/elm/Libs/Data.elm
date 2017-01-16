module Libs.Data exposing (..)

import Libs.Type exposing (Month)


month : List Month
month =
  [ { idx = 1, eng = "January", text = "一月" }
  , { idx = 2, eng = "February", text = "二月" }
  , { idx = 3, eng = "March", text = "三月" }
  , { idx = 4, eng = "April", text = "四月" }
  , { idx = 5, eng = "May", text = "五月" }
  , { idx = 6, eng = "June", text = "六月" }
  , { idx = 7, eng = "July", text = "七月" }
  , { idx = 8, eng = "August", text = "八月" }
  , { idx = 9, eng = "September", text = "九月" }
  , { idx = 10, eng = "October", text = "十月" }
  , { idx = 11, eng = "November", text = "十一月" }
  , { idx = 12, eng = "December", text = "十二月" }
  ]


foodTypes : List String
foodTypes =
  [ "蔬菜", "根莖類", "豆類", "菇類", "穀類", "水果" ]

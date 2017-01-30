module Libs.Data exposing (..)

import Libs.Type exposing (ColorPalette)



foodTypes : List String
foodTypes = [ "蔬菜", "根莖類", "豆類", "菇類", "穀類", "水果" ]


monthList : List Int
monthList = List.range 1 12


colorPalettes : List ColorPalette
colorPalettes =
  [ { name = "胡粉", color = "#FFFFFB", tag = "GOFUN", font = "#373C38" }
  , { name = "白鼠", color = "#BDC0BA", tag = "SHIRONEZUMI", font = "#FFFFFB" }
  , { name = "銀鼠", color = "#91989F", tag = "GINNEZUMI", font = "#FFFFFB" }
  , { name = "藍墨茶", color = "#373C38", tag = "AISUMICHA", font = "#FFFFFB" }
  , { name = "白綠", color = "#A8D8B9", tag = "BYAKUROKU", font = "#FFFFFB" }
  , { name = "若竹", color = "#5DAC81", tag = "WAKATAKE", font = "#FFFFFB" }
  , { name = "青竹", color = "#00896C", tag = "AOTAKE", font = "#FFFFFB" }
  , { name = "老竹", color = "#6A8372", tag = "OITAKE", font = "#FFFFFB" }
  , { name = "空", color = "#58B2DC", tag = "SORA", font = "#FFFFFB" }
  , { name = "莓", color = "#B5495B", tag = "ICHIGO", font = "#FFFFFB" }
  ]

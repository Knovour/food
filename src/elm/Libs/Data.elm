module Libs.Data exposing (..)

import Libs.Type exposing (ColorPalette)



foodTypes : List String
foodTypes = [ "蔬菜", "根莖類", "豆類", "菇類", "穀類", "水果" ]


colorPalettes : List ColorPalette
colorPalettes =
  [ { color = "#FFFFFB", font = "#373C38", tag = "GOFUN",       name = "胡粉" }
  , { color = "#BDC0BA", font = "#FFFFFB", tag = "SHIRONEZUMI", name = "白鼠" }
  , { color = "#91989F", font = "#FFFFFB", tag = "GINNEZUMI",   name = "銀鼠" }
  , { color = "#373C38", font = "#FFFFFB", tag = "AISUMICHA",   name = "藍墨茶" }
  , { color = "#A8D8B9", font = "#FFFFFB", tag = "BYAKUROKU",   name = "白綠" }
  , { color = "#5DAC81", font = "#FFFFFB", tag = "WAKATAKE",    name = "若竹" }
  , { color = "#00896C", font = "#FFFFFB", tag = "AOTAKE",      name = "青竹" }
  , { color = "#6A8372", font = "#FFFFFB", tag = "OITAKE",      name = "老竹" }
  , { color = "#58B2DC", font = "#FFFFFB", tag = "SORA",        name = "空" }
  , { color = "#B5495B", font = "#FFFFFB", tag = "ICHIGO",      name = "莓" }
  ]

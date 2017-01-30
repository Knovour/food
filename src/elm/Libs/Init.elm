module Libs.Init exposing (..)
import Http

import Architecture.Main as Main exposing (..)
import Libs.Parser exposing (parser)



request : Cmd Main.Msg
request =
  let url = "https://cdn.contentful.com/spaces/8whbhu195nq1/entries?access_token=2f74c3147a60b6f114c06133d0badf43b7e2415284385a7dd94def6812e3bb4a"
  in Http.send Content (Http.get url parser)

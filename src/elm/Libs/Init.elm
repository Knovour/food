module Libs.Init exposing (..)
import Http
import Task exposing (..)
import Window

import Architecture.Main   as Main exposing (..)
import Architecture.Screen exposing (..)
import Architecture.Action exposing (..)
import Libs.Parser exposing (parser)



-- INIT

request : Cmd Main.Msg
request =
  let url = "https://cdn.contentful.com/spaces/8whbhu195nq1/entries?access_token=2f74c3147a60b6f114c06133d0badf43b7e2415284385a7dd94def6812e3bb4a"
  in
    Cmd.batch
      [ Http.send Content (Http.get url parser)
      , Task.perform (\w -> Screen <| Width w) Window.width
      , Task.perform tagDisplay Window.width
      , Task.perform layoutDisplay Window.width
      , Task.perform closeSidebar Window.width
      ]



-- SUBSCRIPTIONS

screenSize : Main.Model -> Sub Main.Msg
screenSize model =
  Sub.batch
    [ Window.resizes (\{ width, height } -> Screen <| Resize width height)
    , Window.resizes (\{ width } -> tagDisplay width)
    , Window.resizes (\{ width } -> layoutDisplay width)
    , Window.resizes (\{ width } -> closeSidebar width)
    ]


tagDisplay : Int -> Main.Msg
tagDisplay width =
  if width <= 1120
  then Action <| ShowBy "分頁"
  else NoOp


layoutDisplay : Int -> Main.Msg
layoutDisplay width =
  if width <= 1120
  then Action <| Layout "apps"
  else NoOp


closeSidebar : Int -> Main.Msg
closeSidebar width =
  if width <= 976
  then Action <| Sidebar "close"
  else NoOp

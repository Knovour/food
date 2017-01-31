module Components.Box exposing (box)
import Html exposing (Html, text)

import Architecture.Main as Main
import Architecture.Box  as Box
import Components.Box.InfoBox exposing (infoBox)



box : Box.Model -> Html Main.Msg
box { name, open } =
  if open
  then infoBox
  else text ""

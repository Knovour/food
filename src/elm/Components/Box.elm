module Components.Box exposing (box_)
import Html exposing (Html, text)

import Architecture.Main as Main
import Architecture.Box  as Box
import Components.Box.InfoBox exposing (infoBox)



box_ : Box.Model -> Html Main.Msg
box_ { name, open } = if open then infoBox else text ""

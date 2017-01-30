module Components.Box exposing (box_)
import Html exposing (Html, text)

import Components.Box.InfoBox exposing (infoBox)
import Msg.Main as Main exposing (..)
import Model.Box exposing (Model)



box_ : Model -> Html Main.Msg
box_ { name, open } = if open then infoBox else text ""

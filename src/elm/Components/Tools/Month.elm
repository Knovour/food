module Components.Tools.Month exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Msg.Main as Main exposing (..)

current : Int -> Html Main.Msg
current num = span [] [ text (toString num) ]

month : List a -> List (Html Main.Msg) -> Html Main.Msg
month attr content = div [ class "month" ] content

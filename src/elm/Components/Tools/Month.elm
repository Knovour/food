module Components.Tools.Month exposing (..)

import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Msg.Main as Main exposing (..)

highlight : Bool -> Attribute Main.Msg
highlight isHighlight =
  if isHighlight then
    class "month highlight"
  else
    class "month"

current : Int -> Html Main.Msg
current num = span [] [ text (toString num) ]

month : List (Attribute Main.Msg) -> List (Html Main.Msg) -> Html Main.Msg
month attr content = div attr content

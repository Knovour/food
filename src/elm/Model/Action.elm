module Model.Action exposing (..)


type alias Model =
  { hover : List Int
  , group : String
  , layout : String
  , tag : String
  }


model : Model
model =
  { hover = []
  , group = "蔬菜"
  , layout = "apps"
  , tag = "分頁"
  }

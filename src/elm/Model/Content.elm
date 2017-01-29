module Model.Content exposing (..)
import Dict exposing (Dict)

import Libs.Type exposing (Food)


type alias Model = Dict String (List Food)


model : Model
model = Dict.fromList []

module Architecture.Content exposing (..)
import Http
import Dict exposing (Dict)

import Libs.Normalize exposing (normalize)
import Libs.Type      exposing (Food, Respond)



type alias Model = Dict String (List Food)


model : Model
model = Dict.fromList []


update : (Result Http.Error Respond) -> Model -> Model
update msg model =
  case msg of
    Ok content -> normalize content
    Err _      -> Dict.fromList []

module Architecture.Content exposing (Model, model, update)

import Dict exposing (Dict)
import GraphQL.Client.Http as GraphQLClient
import Libs.Normalize exposing (normalize)
import Libs.Type exposing (Food, Respond)


type alias Model = Dict String (List Food)


model : Model
model = Dict.fromList []


update : Result GraphQLClient.Error Respond -> Model -> Model
update msg contentModel =
  case msg of
    Ok content ->
      let { enName, foods } =
            content
              |> List.head
              |> Maybe.withDefault { enName = "", foods = [] }

          fmtFoods = normalize foods
      in Dict.insert enName fmtFoods contentModel
    Err _ -> contentModel

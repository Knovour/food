module Libs.Graphcool exposing (..)

import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var
import GraphQL.Client.Http as GraphQLClient
import Task exposing (Task)

import Libs.Type exposing (Food, FoodGroup, Respond)


iNeedFoods : String -> Request Query Respond
iNeedFoods foodType =
  extract
    (field "allSpecies"
      [ ("filter", Arg.object
          [ ("enName", Arg.variable (Var.required "enName" .name Var.string)) ]
        )
      ]
      (list (object FoodGroup
        |> with (field "enName" [] string)
        |> with (field "foods" []
            (list (object Food
              |> with (field "name" [] string)
              |> with (field "image" [] string)
              |> with (field "harvest" [] (list int))
            ))
          )
      ))
    )
    |> queryDocument
    |> request { name = foodType }


sendQuery : Request Query a -> Task GraphQLClient.Error a
sendQuery request =
  GraphQLClient.sendQuery "https://api.graph.cool/simple/v1/ciumn017j1m4h01566kut051t" request


generateQueryRequest : String -> Task GraphQLClient.Error Respond
generateQueryRequest foodType =
  foodType
    |> iNeedFoods
    |> sendQuery

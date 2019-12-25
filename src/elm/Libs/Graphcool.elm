module Libs.Graphcool exposing (generateQueryRequest, iNeedFoods, sendQuery)

import Task exposing (Task)
import GraphQL.Client.Http as GraphQLClient
import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var

import Libs.Type exposing (Food, FoodGroup, Respond)


iNeedFoods : String -> Request Query Respond
iNeedFoods foodType =
  extract
    (field "specieses"
      [ ( "where"
        , Arg.object
          [ ("enName", Arg.variable (Var.required "enName" .name Var.string)) ]
        )
      ]
      (list
        (object FoodGroup
          |> with (field "enName" [] string)
          |> with
              (field "foods"
                []
                (list
                  (object Food
                    |> with (field "name" [] string)
                    |> with (field "image" [] string)
                    |> with (field "harvest" [] (list int))
                  )
                )
              )
        )
      )
    )
    |> queryDocument
    |> request { name = foodType }


sendQuery : Request Query a -> Task GraphQLClient.Error a
sendQuery request =
  GraphQLClient.sendQuery "https://us1.prisma.sh/knovour-52731c/diet/dev" request


generateQueryRequest : String -> Task GraphQLClient.Error Respond
generateQueryRequest foodType =
  foodType
    |> iNeedFoods
    |> sendQuery

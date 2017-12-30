module Libs.Graphcool exposing (..)
import GraphQL.Request.Builder exposing (..)
import GraphQL.Request.Builder.Arg as Arg
import GraphQL.Request.Builder.Variable as Var
import GraphQL.Client.Http as GraphQLClient





type alias Species =
    { id : String
    , enName : String
    , name : String
    }

type alias AllSpecies = List Species

starWarsRequest : Request Query AllSpecies
starWarsRequest =
        extract
            (field "allSpecies"
                []
                (list (object Species
                    |> with (field "id" [] string)
                    |> with (field "enName" [] string)
                    |> with (field "name" [] string)
                ))
            )
            |> queryDocument
            |> request {}


type alias StarWarsResponse =
    Result GraphQLClient.Error AllSpecies


type alias Model =
    Maybe StarWarsResponse


type Msg
    = ReceiveQueryResponse StarWarsResponse


sendQueryRequest : Request Query a -> Task GraphQLClient.Error a
sendQueryRequest request =
    GraphQLClient.sendQuery "https://api.graph.cool/simple/v1/ciumn017j1m4h01566kut051t" request


sendStarWarsQuery : Cmd Msg
sendStarWarsQuery =
    sendQueryRequest starWarsRequest
        |> Task.attempt ReceiveQueryResponse


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( Nothing, sendStarWarsQuery )


view : Model -> Html Msg
view model =
    div []
        [ model
        |> Maybe.withDefault (Ok [])
        |> Result.withDefault []
        |> List.map(\{ name } -> name)
        |> toString
        |> text
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update (ReceiveQueryResponse response) model =
    ( Just response, Cmd.none )

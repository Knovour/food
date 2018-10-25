module Architecture.Filter exposing (Model, Msg(..), model, update)


type alias Model =
  { month : List Int
  , name : String
  , now : Int
  }


model : Model
model =
  { month = []
  , name = ""
  , now = 0
  }


type Msg
  = Month Int
  | ClearMonth
  | Name String
  | Now Int


update : Msg -> Model -> Model
update filterMsg filterModel =
  case filterMsg of
    Month num ->
      let selectedMonth =
            if List.member num filterModel.month
            then List.filter ((/=) num) filterModel.month
            else num :: filterModel.month
      in { filterModel | month = selectedMonth }
    ClearMonth -> { filterModel | month = [] }
    Name str -> { filterModel | name = str }
    Now month -> { filterModel | now = month }

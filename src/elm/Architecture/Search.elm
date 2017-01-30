module Architecture.Search exposing (..)



type alias Model =
  { month : List Int
  , name : String
  }


model : Model
model =
  { month = []
  , name = ""
  }


type Msg
  = SelectMonth Int
  | UnSelectMonth Int
  | Name String


update : Msg -> Model -> Model
update searchMsg model =
  case searchMsg of
    SelectMonth num ->
      let newList = num :: model.month
      in { model | month = newList }
    UnSelectMonth num ->
      let newList = List.filter (\m -> m /= num) model.month
      in  { model | month = newList }
    Name str -> { model | name = str }

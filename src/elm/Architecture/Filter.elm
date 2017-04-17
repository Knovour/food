module Architecture.Filter exposing (..)



type alias Model =
  { month : List Int
  , name  : String
  }


model : Model
model =
  { month = []
  , name  = ""
  }


type Msg
  = Month Int
  | ClearMonth
  | Name String


update : Msg -> Model -> Model
update filterMsg model =
  case filterMsg of
    Month num ->
      if List.member num model.month
      then { model | month = List.filter (\m -> m /= num) model.month }
      else { model | month = num :: model.month }
    ClearMonth -> { model | month = [] }
    Name str -> { model | name = str }

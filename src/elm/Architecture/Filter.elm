module Architecture.Filter exposing (..)



type alias Model =
  { month : List Int
  , name  : String
  , now   : Int
  }


model : Model
model =
  { month = []
  , name  = ""
  , now   = 0
  }


type Msg
  = Month Int
  | ClearMonth
  | Name String
  | Now Int


update : Msg -> Model -> Model
update filterMsg model =
  case filterMsg of
    Month num ->
      if List.member num model.month
      then { model | month = List.filter ((/=) num) model.month }
      else { model | month = num :: model.month }
    ClearMonth -> { model | month = [] }
    Name str -> { model | name = str }
    Now month -> { model | now = month }

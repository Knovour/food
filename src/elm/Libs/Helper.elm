module Libs.Helper exposing (..)


include : Int -> List Int -> Bool
include current list=
  List.member current list

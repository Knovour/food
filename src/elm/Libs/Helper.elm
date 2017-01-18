module Libs.Helper exposing (..)


include : List Int -> Int -> Bool
include list current =
  List.member current list

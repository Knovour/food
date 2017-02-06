module Components.Tools.Display exposing (..)
import Html            exposing (Html, div, p, i, text)
import Html.Attributes exposing (class)
import Html.Events     exposing (onClick)

import Architecture.Main   as Main   exposing (..)
import Architecture.Action as Action exposing (..)



display : Action.Model -> Html Main.Msg
display action =
  div [ class "options-block toggle-display" ]
    [ p [ class "heading" ] [ text "顯示方式" ]
    , layout action.layout
    , tag action.showBy
    ]


layout : String -> Html Main.Msg
layout toggle =
  let toggleClass =
        if toggle == "menu"
        then " toggle"
        else ""
  in div [ class ("display-switch" ++ toggleClass) ] (switch [ "apps", "menu" ] toggle "layout")


tag : String -> Html Main.Msg
tag toggle  =
  let toggleClass =
        if toggle == "標籤"
        then " toggle"
        else ""
  in div [ class ("display-switch" ++ toggleClass) ] (switch [ "分頁", "標籤" ] toggle "tag")


switch : List String -> String -> String -> List (Html Main.Msg)
switch options toggle target =
  List.map (\opt ->
    let active =
          if toggle == opt
          then " _active"
          else ""
        click =
          if target == "layout"
          then Action <| Layout opt
          else Action <| ShowBy opt
        dom =
          if target == "layout"
          then div [ class ("layout opt" ++ active), onClick click ] [ i [ class "material-icons icon" ] [ text opt ] ]
          else div [ class ("tag opt" ++ active), onClick click ] [ text opt ]
    in dom
  ) options

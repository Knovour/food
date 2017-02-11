module Components.Tools.Display exposing (..)
import Html            exposing (Html, div, p, i, text)
import Html.Attributes exposing (class, classList)
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
  div
    [ classList
      [ ("display-switch", True)
      , ("toggle", toggle == "menu")
      ]
    ] (switch [ "apps", "menu" ] toggle "layout")


tag : String -> Html Main.Msg
tag toggle  =
  div
    [ classList
      [ ("display-switch", True)
      , ("toggle", toggle == "標籤")
      ]
    ] (switch [ "分頁", "標籤" ] toggle "tag")


switch : List String -> String -> String -> List (Html Main.Msg)
switch options toggle target =
  List.map (\opt ->
    let classes =
          classList
            [ ("layout", target == "layout")
            , ("tag", target /= "layout")
            , ("opt", True)
            , ("_active", toggle == opt)
            ]
        click =
          if target == "layout"
          then Action <| Layout opt
          else Action <| ShowBy opt
        switchLabel =
          if target == "layout"
          then i [ class "material-icons icon" ] [ text opt ]
          else text opt
    in div [ classes, onClick click ] [ switchLabel ]
  ) options

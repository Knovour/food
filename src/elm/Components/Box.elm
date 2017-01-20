module Components.Box exposing (box_)

import Html exposing (Html, text)

import Msg.Main as Main exposing (..)
import Model.Box exposing (Model)

import Components.Box.InfoBox exposing (infoBox)


box_ : Model -> Html Main.Msg
box_ { name, open } =
  if open then
    infoBox
  else
    text ""
  -- let
  --   toggleOpen =
  --     if boxModel.open then
  --       "_slide-in"
  --     else
  --       "_slide-out"

  --   classes = "modal-block _depth-4 " ++ toggleOpen

  --   image =
  --     if boxModel.food /= "" then
  --       "https://dl.dropboxusercontent.com/u/1419724/img/" ++ boxModel.food ++ ".webp"
  --     else
  --       ""

  --   harvestList =
  --     rowData
  --       |> List.filter (\{ name } -> name == boxModel.food)
  --       |> List.head
  --       |> Maybe.withDefault
  --         { url = ""
  --         , imgFrom = ""
  --         , name = ""
  --         , species = ""
  --         , harvest = []
  --         }
  --       |> .harvest

  --   harvestCalendar =
  --     h6 [ class "heading" ] [ text "盛產期" ]
  --       :: List.map (\month ->
  --           let
  --             classes =
  --               if List.member month harvestList then
  --                 "month highlight"
  --               else
  --                 "month"
  --           in
  --             span [ class classes ] [ text (toString month) ]
  --         ) (List.range 1 12)
  -- in
  --   div [ class classes ]
  --     [ div [ class "modal-media" ]
  --       [ div [ class "media -circle" ]
  --         [ img [ class "image", src image, alt "" ] []
  --         ]
  --       , div [ class "harvest-list" ]
  --         harvestCalendar
  --       ]
  --     , div [ class "modal-content" ]
  --       [ h1 [ class "heading" ] [ text boxModel.food ]
  --       , h3 [ class "subheading" ] [ text "營養成分表（以每份 100 g 計）＃目前是假資料" ]
  --       , table [ class "ingredients-table" ]
  --         [ tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "熱量" ]
  --             , span [ class "value" ] [ text "24 kcal" ]
  --             ]
  --           , td [] []
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "碳水化合物" ]
  --             , span [ class "value" ] [ text "6 g" ]
  --             ]
  --           , td [ class "subdata" ]
  --             [ span [ class "label" ] [ text "膳食纖維" ]
  --             , span [ class "value" ] [ text "3 g" ]
  --             ]
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ] []
  --           , td [ class "subdata" ]
  --             [ span [ class "label" ] [ text "食糖" ]
  --             , span [ class "value" ] [ text "3.5 g" ]
  --             ]
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "蛋白質" ]
  --             , span [ class "value" ] [ text "1 g" ]
  --             ]
  --           , td [] []
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "脂肪" ]
  --             , span [ class "value" ] [ text "0.2 g" ]
  --             ]
  --           , td [ class "subdata" ]
  --             [ span [ class "label" ] [ text "飽和脂肪" ]
  --             , span [ class "value" ] [ text "0 g" ]
  --             ]
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ] []
  --           , td [ class "subdata" ]
  --             [ span [ class "label" ] [ text "多元不飽和脂肪" ]
  --             , span [ class "value" ] [ text "0.1 g" ]
  --             ]
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ] []
  --           , td [ class "subdata" ]
  --             [ span [ class "label" ] [ text "單元不飽和脂肪" ]
  --             , span [ class "value" ] [ text "0 g" ]
  --             ]
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "膽固醇" ]
  --             , span [ class "value" ] [ text "0 mg" ]
  --             ]
  --           , td [] []
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "鈉" ]
  --             , span [ class "value" ] [ text "2 mg" ]
  --             ]
  --           , td [ class "data" ]
  --             [ span [ class "label" ] [ text "鉀" ]
  --             , span [ class "value" ] [ text "229 mg" ]
  --             ]
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "鈣" ]
  --             , span [ class "value" ] [ text "9 mg" ]
  --             ]
  --           , td [ class "data" ]
  --             [ span [ class "label" ] [ text "鐵" ]
  --             , span [ class "value" ] [ text "0.2 mg" ]
  --             ]
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "鎂" ]
  --             , span [ class "value" ] [ text "14 mg" ]
  --             ]
  --           , td [] []
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "維生素 A" ]
  --             , span [ class "value" ] [ text "23 IU" ]
  --             ]
  --           , td [ class "data" ]
  --             [ span [ class "label" ] [ text "維生素 C" ]
  --             , span [ class "value" ] [ text "2.2 mg" ]
  --             ]
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "維生素 D" ]
  --             , span [ class "value" ] [ text "0 IU" ]
  --             ]
  --           , td [ class "data" ]
  --             [ span [ class "label" ] [ text "维生素 B6" ]
  --             , span [ class "value" ] [ text "0.1 mg" ]
  --             ]
  --           ]
  --         , tr [ class "row" ]
  --           [ td [ class "data" ]
  --             [ span [ class "label" ] [ text "維生素 B12" ]
  --             , span [ class "value" ] [ text "0 µg" ]
  --             ]
  --           ]
  --         ]
  --       ]
  --     , i [ class "mdi mdi-window-close close", onClick (BoxMsg <| Close) ] []
  --     ]

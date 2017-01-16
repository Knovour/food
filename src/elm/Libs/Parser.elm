module Libs.Parser exposing (parser)

import Json.Decode as Decode exposing (Decoder)
import Libs.Type exposing (Item, Asset, Respond)


parser : Decoder Respond
parser =
  Decode.map2 Respond
    (Decode.field "items" (Decode.list decodeItem))
    (Decode.at [ "includes", "Asset" ] (Decode.list decodeAsset))


decodeItem : Decoder Item
decodeItem =
  Decode.map4 Item
    (Decode.at [ "fields", "name" ] Decode.string)
    (Decode.at [ "fields", "image" ] decodeImageId)
    (Decode.at [ "fields", "species" ] Decode.string)
    (Decode.at [ "fields", "harvest" ] (Decode.list Decode.string))

decodeImageId : Decoder String
decodeImageId = Decode.at [ "sys", "id" ] Decode.string


decodeAsset : Decoder Asset
decodeAsset =
  Decode.map3 Asset
    (Decode.at [ "sys", "id" ] Decode.string)
    (Decode.at [ "fields", "file" ] decodeUrl)
    (Decode.at [ "fields", "description" ] Decode.string)

decodeUrl : Decoder String
decodeUrl =
  Decode.field "url" Decode.string



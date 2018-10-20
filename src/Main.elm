module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text, br)
import Html.Events exposing (onClick)
import Counter
import List.Extra

main =
  Browser.sandbox
    { init = [ 1, 2, 3, 4, 5],
      update = update,
      view = view }


type alias Model = List Counter.Model

type Msg = NthCounterMsg Int Counter.Msg

update : Msg -> Model -> Model
update msg model =
  case msg of
    NthCounterMsg idx counterMsg ->
       model |> List.Extra.updateAt idx (Counter.update counterMsg)


view : Model -> Html Msg
view model =
  div [] (model
    |> List.indexedMap (\idx counterModel ->
      [ Counter.view counterModel |> Html.map (NthCounterMsg idx)
      , br [] [] ]
    )
    |> List.concat
  )

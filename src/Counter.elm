module Counter exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

type alias Model = Int

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1
        Decrement ->
            model - 1

view : Int -> Html Msg
view value =
    div []
      [ button [ onClick Decrement ] [ text "-" ]
      , div [] [ text (String.fromInt value) ]
      , button [ onClick Increment ] [ text "+" ]
      ]

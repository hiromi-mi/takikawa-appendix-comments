import Browser
import Html exposing (Html, button, div, text, pre, input, Attribute)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

-- MAIN

main = 
   Browser.element
   { init = init
   , view = view
   , update = update
   , subscriptions = subscriptions
   }

-- MODEL

type alias Model =
   { content : String
   , updatingcontent : String
   }

-- init : JSON.Decode.Value -> (Model, Cmd Msg)
init : () -> (Model, Cmd Msg)
init _ = ({content = "", updatingcontent = "" }, Cmd.none)

-- update
type Msg = Append String | Update

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
   case msg of
      Append newContent ->
         ( { model | updatingcontent = newContent},  Cmd.none )
      Update ->
         ( { model | content = model.updatingcontent, updatingcontent = ""}, Cmd.none )


-- subscriptions
subscriptions _ = Sub.none

-- view
-- view : Model -> Html Msg
view model =
   div []
      [ input [ placeholder "Comments: ", value model.updatingcontent, onInput Append ] []
      , button [ onClick Update ] [text "Push"]
      , div [] [text model.content]
      ]

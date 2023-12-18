module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url
import Url.Parser as Parse exposing (Parser, (</>), int, map, oneOf, s, string, parse)

-- Main

main : Program () Model Msg
main = 
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChange
    , onUrlRequest = LinkClicked
    }

-- Model

type Route
  = Home
  | Profile
  | Unknown

type alias Model =
  { key : Nav.Key
  , url : Url.Url
  , route : Route
  }

routeParser : Parser (Route -> a) a
routeParser =
  oneOf
    [ Parse.map Home    (Parse.s "home")
    , Parse.map Profile (Parse.s "profile")
    ]

findRoute : Parser (Route -> a) a -> Url.Url -> Route
findRoute p url =
  let temp = parse routeParser url in
      case temp of
        Just Home -> Home
        Just Profile -> Profile
        Just Unknown -> Unknown
        Nothing -> Unknown

init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
  ( Model key url Home, Cmd.none )

-- update

type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChange Url.Url

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    LinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Nav.pushUrl model.key (Url.toString url) )

        Browser.External href ->
          ( model, Nav.load href )

    UrlChange url ->
      ( { key = model.key
        , url = url
        , route = findRoute routeParser url }
      , Cmd.none
      )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none

-- View

view : Model -> Browser.Document Msg
view model =
  { title = "URL Interceptor"
  , body =
      [ text "The current URL is: "
      , b [] [ text (Url.toString model.url) ]
      , b [] [ text ("current path: " ++ (if model.route == Home then "\\home" else "\\else"))]
      , ul []
          [ viewLink "/home"
          , viewLink "/profile"
          ]
      ]
  }

-- Html msg is the return for html structures
viewLink : String -> Html msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]

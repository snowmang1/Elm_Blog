module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url
import Url.Parser as Parse exposing (Parser, (</>), int, map, oneOf, s, string, parse)

import NavBar exposing (nav)
import PostTools exposing (post, allPosts)
import Style exposing (backStyle, backDropStyle)
import Footer exposing (footer)
import About exposing (aboutPage)

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
  | About
  | Post String
  | AllPosts
  | Unknown

type alias Model =
  { key : Nav.Key
  , url : Url.Url
  , route : Route
  }

routeParser : Parser (Route -> a) a
routeParser =
  oneOf
    [ Parse.map Home  (Parse.s "home")
    , Parse.map About (Parse.s "about")
    , Parse.map AllPosts (Parse.s "posts")
    , Parse.map Post (Parse.s "post" </> string)
    ]

findRoute : Parser (Route -> a) a -> Url.Url -> Route
findRoute p url =
  let temp = parse routeParser url in
      case temp of
        Just Home -> Home
        Just About -> About
        Just (Post s) -> Post s
        Just AllPosts -> AllPosts
        _ -> Unknown

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
        , route = findRoute routeParser url 
        }
      , Cmd.none
      )

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none

-- View

view : Model -> Browser.Document Msg
view model =
  { title = "Snowmang1 blog"
  , body =
      case model.route of
        Home ->
          [ div backDropStyle [],
            div
            backStyle
            [ NavBar.nav
            , PostTools.post "0"
            ]
          ]

        Post s ->
          [ div backDropStyle [],
            div
            backStyle
            [ NavBar.nav
            , PostTools.post s
            ]
          ]

        About ->
          [ div backDropStyle [],
            div
            backStyle
            [ NavBar.nav
            , aboutPage
            , Footer.footer
            ]
          ]

        AllPosts ->
          [ div backDropStyle [],
            div
            backStyle
            [ NavBar.nav
            , allPosts
            , Footer.footer
            ]
          ]

        _ ->
          [ div
            backStyle
            [ div [style "color" "white" ]
              [ text "404 unkown path" ] ]
          ]
  }

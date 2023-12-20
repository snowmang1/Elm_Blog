module NavBar exposing (nav)

import Browser
import Html exposing (Html, img, nav, text, a, div)
import Html.Attributes exposing (src, style, href)

import MarkDownComp exposing (mdComp)

import Style exposing (bar)

-- NavBar

nav : Html msg
nav = Html.nav bar
  [ a [ href "\\about" ]
      [ img [ src "https://avatars.githubusercontent.com/u/31263887?v=4"
        , style "max-width" "30%"
        , style "max-height" "30%"
        , style "border-radius" "100%"
        , style "margin-top" "5%"
        ]
        [ text "Snowmang1's Thinking Space'"]
      ]
  , div [] []
  , a [ href "\\home"
      , style "color" "#94e2d5"
      , style "text-decoration" "none"
      ] [ text "Home" ]
  ]

module Footer exposing (footer)

import Html exposing (Html, text, div)

import Style exposing (footStyle)

-- footer

footer : Html msg
footer = div footStyle
  [ text "Built with Elm-lang"
  , div [] []
  , text "Hosted on Github Pages"]

module Style exposing (bar, postStyle, backStyle, footStyle, aboutStyle)

import Html exposing (Attribute)
import Html.Attributes exposing (style)

-- style

bar : List (Attribute msg)
bar =
  [ style "float" "left"
  , style "text-align" "center"
  , style "width" "15%"
  ]

postStyle : List (Attribute msg)
postStyle =
  [ style "text-align" "center"
  , style "margin-left" "1%"
  , style "margin-right" "1%"
  , style "width" "78%"
  , style "background-image" "linear-gradient(90deg, transparent, #f9e2af, #f9e2af, #f9e2af, transparent)"
  ]

backStyle : List (Attribute msg)
backStyle =
  [ style "display" "flex"
  , style "background-color" "#1e1e2e"
  , style "top" "0" --This is for index.html struggles
  , style "left" "0"
  , style "right" "0"
  , style "bottom" "0"
  , style "background-size" "cover"
  , style "position" "absolute"
  , style "height" "100%"
  , style "width" "100%"
  ]

footStyle : List (Attribute msg)
footStyle =
  [ style "position" "fixed"
  , style "background-image" "linear-gradient(transparent, #313244)"
  , style "bottom" "0"
  , style "color" "#6c7086"
  , style "height" "10%"
  , style "width" "100%"
  , style "text-align" "center"
  ]

aboutStyle : List (Attribute msg)
aboutStyle =
  [ style "background-image" "linear-gradient(90deg, transparent, #313244, #313244, transparent)"
  , style "color" "#cba6f7"
  , style "font-size" "large"
  , style "text-align" "center"
  , style "width" "60%"
  , style "margin-left" "10%"
  ]

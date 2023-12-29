module Style exposing
  ( bar
  , postStyle
  , backStyle
  , footStyle
  , aboutStyle
  , backDropStyle
  , allpStyle
  , postBox
  )

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
  [ style "width" "80%"
  , style "display" "flex"
  , style "text-align" "center"
  , style "justify-content" "center"
  , style "align-content" "center"
  , style "color" "black"
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
  , style "overscroll-behavior-x" "none"
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

backDropStyle : List (Attribute msg)
backDropStyle =
  [ style "position" "fixed"
  , style "width" "300%"
  , style "height" "300%"
  , style "top" "-100%"
  , style "right" "-100%"
  , style "background-color" "#1e1e2e"
  , style "z-index" "-2"
  ]

allpStyle : List (Attribute msg)
allpStyle =
  [ style "color" "#f5c2e7"
  , style "display" "flex"
  , style "flex-direction" "column"
  , style "width" "50%"
  , style "margin-left" "15%"
  , style "text-align" "center"
  , style "align-content" "center"
  , style "line-height" "25px"
  ]

postBox : List (Attribute msg)
postBox =
  [ style "color" "#94e2d5"
  , style "border" "groove"
  , style "border-color" "#b4befe"
  , style "margin-top" "1%"
  ]

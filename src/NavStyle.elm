module Style exposing
  (bar, postStyle, backStyle)

import Html exposing (Attribute)
import Html.Attributes exposing (style)

-- style

bar : List (Attribute msg)
bar =
  [ style "float" "left"
  , style "text-align" "center"
  , style "width" "20%"
  ]

postStyle : List (Attribute msg)
postStyle =
  [ style "text-align" "center"
  , style "width" "60%"
  ]

backStyle : List (Attribute msg)
backStyle =
  [ style "display" "flex"
  , style "background-color" "#11111b"
  ]

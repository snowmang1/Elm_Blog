module Post exposing (post)

import Html exposing (Html, div)
import Markdown exposing (toHtml)

import Strings exposing (posts)
import Style exposing (postStyle)

-- Post

post : Html msg
post = toHtml postStyle
  ( case (List.head Strings.posts) of
      Just s -> s

      Nothing -> "No posts"
  )

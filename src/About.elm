module About exposing (aboutPage)

import Html exposing (Html, div, text)
import Style exposing (aboutStyle)

import MarkDownComp exposing (mdComp)

-- aboutPage

aboutPage : Html msg
aboutPage = div aboutStyle
  [ div [] []
  , mdComp [] aboutPageMarkdown
  ]

aboutPageMarkdown = """
# About Snowmang1

I am an eternal student of the sciences, mainly computer science and mathmatics.
You have stumbled across my thinking space created in 2023. I use this place as
a sort of science journal to write about things I find interesting. It is completely
hosted on [Gitub](https://github.com/snowmang1) [Pages](https://pages.github.com).
You can probably find any code
I display here in that same github if you look hard enough. If you were wondering how
I built this page there is a blog post on it <link to post>. The way this site works
is that you go to the left nav column and click posts, that will take you to the
latest post. If you want to look through all my posts you should be able to click an
all posts button (but it might not be built yet).

Thank you so much for looking at my page!!!!
"""

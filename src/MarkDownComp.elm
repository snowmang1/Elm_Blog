module MarkDownComp exposing (mdComp)

import Markdown exposing (toHtmlWith, Options)
import Html exposing (Html, Attribute)

-- compile functions

mdComp : List (Attribute msg) -> String -> Html msg
mdComp al s = toHtmlWith mdOptions al (linkStyleing ++ s)

mdOptions : Options
mdOptions =
  { githubFlavored = Just { tables = True, breaks = False }
  , defaultHighlighting = Nothing
  , sanitize = False
  , smartypants = True
  }

linkStyleing : String
linkStyleing = """
<style>
  a:link {
    color: #94e2d5;
    text-decoration: none;
  }

  a:visited {
    color: #a6e3a1;
    text-decoration: none;
  }

  a:hover {
    color: #74c7ec;
    text-decoration: none;
  }

  a:active {
    color: #89b4fa;
    text-decoration: none;
  }
</style>
"""

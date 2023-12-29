module Posts exposing (posts, PElem)

type alias PElem =
  { title : String
  , date  : String
  , body  : String
  }

posts : List PElem
posts = [post0, post1]

post0 : PElem
post0 = 
  { title = "Building_an_Elm_blog"
  , date  = "1/12/2023"
  , body  = """
# Building a Simple Blog in Elm
A post about my first experiences with the language Elm language and all its quirks.
I will use the language to build this blog and try my best to analyze multiple parts
of it. My biggest curiosity is the error messages coming into this. I came expecting
a simple web driven, functional language but found so much more.

line2

line3

line4

line5

line6

line7

line8

line9

line10
  """
  }

post1 : PElem
post1 =
  { title = "Post_1"
  , date  = "1/11/2023"
  , body  = """
# Combinators
  """
  }

module PostTools exposing (post, allPosts)

import Html exposing (Html, div, ul, li, a)
import Html.Attributes exposing (style, href)
import Markdown exposing (toHtml)

import List exposing (map)

import Posts exposing (posts, PElem)
import Style exposing (postStyle, allpStyle, postBox)

-- Post

post : String -> Html msg
post t =
  case t of
    "0" ->
      ( case (List.head Posts.posts) of
          Just s -> div postStyle [ toHtml [ style "width" "60%" ] s.body ]
          Nothing -> div [] [ Html.text "No posts" ]
      )
    _ ->
      ( case (findPost t Posts.posts) of
          Just s -> div postStyle [ toHtml [ style "width" "60%" ] s.body ]
          Nothing -> div [] [ Html.text "No posts" ]
      )

allPosts : Html msg
allPosts =
  let pl = List.map link2Post posts in
  div allpStyle pl

findPost : String -> List PElem -> Maybe PElem
findPost t l =
  case (List.filter (\x -> t == x.title) l) of
    [] -> Nothing
    ok -> List.head ok

link2Post : PElem -> Html msg
link2Post p =
  a [ href ("post/" ++ p.title)
    , style "color" "#94e2d5"
    , style "text-decoration" "none"
    ]
    [ getPreview p ]

getPreview : PElem -> Html msg
getPreview p =
  String.lines p.body
  |> List.take 5
  |> List.append ["Estimated read time: " ++ getReadTime p ++ " min"]
  |> List.map (\x -> String.append x "\n")
  |> String.concat
  |> toHtml postBox

getReadTime : PElem -> String
getReadTime p =
  String.fromInt ((List.length (String.words p.body)) // 200)
  

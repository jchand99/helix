; Start tags

((element (start_tag (tag_name) @tag) (text) @markup.underline)
 (#eq? @tag "u"))

((element (start_tag (tag_name) @tag) (text) @markup.inline)
 (#match? @tag "^(code|kbd)$"))

((element (start_tag (tag_name) @tag) (text) @markup.link.url)
 (#eq? @tag "a"))

((element (start_tag (tag_name) @constructor (#match? @constructor "^[A-Z]"))))
((element (start_tag ["<" ">"] @punctuation.bracket)))

; Self closing tags

((element (self_closing_tag ["<" ">" "/>"] @punctuation.bracket)))
((element (self_closing_tag (tag_name) @constructor (#match? @constructor "^[A-Z]"))))

; End tags

((element (end_tag (tag_name) @constructor (#match? @constructor "^[A-Z]"))))
((element (end_tag ["</" ">"] @punctuation.bracket)))

; Attribute

(attribute (attribute_name) @variable.other.member)
((attribute
   (attribute_name) @attr
   (quoted_attribute_value (attribute_value) @markup.link.url))
 (#match? @attr "^(href|src)$"))

(tag_name) @tag
(attribute_name) @variable.other.member
(erroneous_end_tag_name) @error
(comment) @comment

[
  (attribute_value)
  (quoted_attribute_value)
] @string

[
  (text)
  (raw_text_expr)
] @none

[
  (special_block_keyword)
  (then)
  (as)
] @keyword

[
  "{"
  "}"
] @punctuation.brackets

"=" @operator

[
  "<"
  ">"
  "</"
  "/>"
  "#"
  ":"
  "/"
  "@"
] @punctuation.definition.tag
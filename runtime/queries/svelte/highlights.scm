; Attributes

(attribute (attribute_name) @variable.other.member)
(attribute (attribute_name ["{" "}"] @punctuation.bracket))
(attribute "=" @punctuation.delimiter)
(attribute (expr_attribute_value (expression ["{" "}"] @punctuation.bracket)))
(attribute (quoted_attribute_value) @string)

; Start tags

(start_tag (tag_name) @constructor (#match? @constructor "^[A-Z]"))
(start_tag (tag_name) @tag)
(start_tag ["<" ">"] @punctuation.bracket)

; Self closing tags

(self_closing_tag (tag_name) @constructor (#match? @constructor "^[A-Z]"))
(self_closing_tag (tag_name) @tag)
(self_closing_tag ["<" ">" "/>"] @punctuation.bracket)

; End tags

(end_tag (tag_name) @constructor (#match? @constructor "^[A-Z]"))
(end_tag (tag_name) @tag)
(end_tag ["</" ">"] @punctuation.bracket)

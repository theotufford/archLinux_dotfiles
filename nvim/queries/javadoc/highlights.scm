;; extends

; Capitalized methods in javadoc references are treated as constructors.
(((method
    (identifier) @constructor)
    (#lua-match? @constructor "^[A-Z]")))

; Screaming-case members are treated as constants.
((member
  (identifier) @constant)
  (#lua-match? @constant "^[A-Z_][A-Z0-9_]+$"))

; Camel-case members are treated as types.
((member
  (identifier) @type)
  (#lua-match? @type "^[A-Z].*[a-z]"))

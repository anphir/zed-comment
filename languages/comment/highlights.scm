; TODO: tree-sitter-comment supports mostly arbitrary tag names.
;   Perhaps have a fall-through query highlighting these as NOTE?
; TODO: Highlighting for URI?

; NOTE group.
(_
    (tag
        (name) @capture @comment.note.name
        ; Currently the user does not get a specific highlighting.
        ; "(" @comment.error
        ; (user) @comment.error
        ; ")" @comment.error
        ; ":" @comment.error
    )
    "text" @comment.note
    ; TODO: Complete list of tags to be highlighted as NOTE.
    ;   Check which tag names are supported by tree-sitter-comment.
    (#any-of? @capture "NOTE" "INFO")
)

; TODO group.
(_
    (tag
        (name) @capture @comment.todo.name
    )
    "text" @comment.todo
    ; TODO: Complete list of tags to be highlighted as TODO.
    (#any-of? @capture "TODO" "WIP")
)

; WARNING group.
(_
    (tag
        (name) @capture @comment.warning.name
    )
    "text" @comment.warning
    ; TODO: Complete list of tags to be highlighted as WARNING.
    (#any-of? @capture "WARNING" "WARN")
)

; ERROR group.
(_
    (tag
        (name) @capture @comment.error.name
    )
    "text" @comment.error
    ; TODO: Complete list of tags to be highlighted as ERROR.
    (#any-of? @capture "BUG" "ERROR" "FIXME")
)

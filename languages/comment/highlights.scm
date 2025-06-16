; TODO: tree-sitter-comment supports mostly arbitrary tag names.
;   Perhaps have a fall-through query highlighting these as NOTE?
; TODO: Support additional tag names?
; TODO: Highlighting for URI?

; Note group.
;   Highlights all text nodes of this comment group.
;   For long multi-line commits this might be a bit excessive, especially for error comments.
; TODO: Would be nice if this were an option a user could turned off or on.
; TODO: Optional highlighting of the tag user would also be nice.
(_
    ; Match only on the first occurence of tag.
    . (tag
        (name) @capture @comment.note.name
        ; Currently the user does not get a specific highlighting.
        ; "(" @comment.error
        ; (user) @comment.error
        ; ")" @comment.error
        ; ":" @comment.error
    )
    (#any-of? @capture "NOTE" "INFO")
) @comment.note

; Todo group.
(_
    . (tag
        (name) @capture @comment.todo.name
    )
    (#any-of? @capture "TODO" "WIP")
) @comment.todo

; Warning group.
(_
    . (tag
        (name) @capture @comment.warning.name
    )
    (#any-of? @capture "WARNING" "WARN")
) @comment.warning

; Error group.
(_
    . (tag
        (name) @capture @comment.error.name
    )
    (#any-of? @capture "BUG" "ERROR" "FIXME")
) @comment.error

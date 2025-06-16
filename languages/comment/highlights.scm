; TODO: tree-sitter-comment supports mostly arbitrary tag names.
;   Perhaps have a fall-through query highlighting these as NOTE?
; TODO: Support additional tag names?
; TODO: Highlighting for URI?

; Note group.
;   Highlights all text nodes of this comment group.
;   For long multi-line commits this might be a bit excessive, especially for error comments.
; TODO: Would be nice if this were an option a user could turned off or on.
; TODO: Optional highlighting of the tag user would also be nice.
;   We could add another style e.g. comment.note.user or simply a comment.user if we want a single style1
;   for all comment groups.
(_
    ; Match only on the first occurence of tag.
    . (tag
        (name) @capture @comment.note.name
        ; NOTE: The `(user):` part is optional, so match with trailing `?`.
        ; INFO: Styles for (, ), : chosen according to Rust's `highlighting.scm`.
        "("? @punctuation.bracket
        (user)? @comment.note.user
        ")"? @punctuation.bracket
        ":"? @punctuation.delimiter
    )
    (#any-of? @capture "NOTE" "INFO")
) @comment.note

; Todo group.
(_
    . (tag
        (name) @capture @comment.todo.name
        "("? @punctuation.bracket
        (user)? @comment.todo.user
        ")"? @punctuation.bracket
        ":"? @punctuation.delimiter
    )
    (#any-of? @capture "TODO" "WIP")
) @comment.todo

; Warning group.
(_
    . (tag
        (name) @capture @comment.warning.name
        "("? @punctuation.bracket
        (user)? @comment.warning.user
        ")"? @punctuation.bracket
        ":"? @punctuation.delimiter
    )
    (#any-of? @capture "WARNING" "WARN")
) @comment.warning

; Error group.
(_
    . (tag
        (name) @capture @comment.error.name
        "("? @punctuation.bracket
        (user)? @comment.error.user
        ")"? @punctuation.bracket
        ":"? @punctuation.delimiter
    )
    (#any-of? @capture "BUG" "ERROR" "FIXME")
) @comment.error

; STASH
;
; Highlights all tag names of this comment group.
; (tag
;      (name) @capture @comment.note.name
;      (#any-of? @capture "NOTE" "INFO")
; )

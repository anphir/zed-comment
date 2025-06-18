; Note group.
(_  ; Match on comment.
    . (tag  ; Match on the first occurence of a tag.
        (name) @tag_name @comment.note.name
        ; NOTE: The `(user)` part is optional, so match with trailing `?`.
        ; INFO: Styles for (, ), : chosen according to Rust's `highlighting.scm`.
        "("? @punctuation.bracket
        (user)? @comment.note.user
        ")"? @punctuation.bracket
        ":"? @punctuation.delimiter
    )
    (uri)? @link_uri
    (#any-of? @tag_name "INFO" "NOTE")
) @comment.note

; Todo group.
(_
    . (tag
        (name) @tag_name @comment.todo.name
        "("? @punctuation.bracket
        (user)? @comment.todo.user
        ")"? @punctuation.bracket
        ":"? @punctuation.delimiter
    )
    (uri)? @link_uri
    (#any-of? @tag_name "TEST" "TODO" "WIP")
) @comment.todo

; Warning group.
(_
    . (tag
        (name) @tag_name @comment.warning.name
        "("? @punctuation.bracket
        (user)? @comment.warning.user
        ")"? @punctuation.bracket
        ":"? @punctuation.delimiter
    )
    (uri)? @link_uri
    (#any-of? @tag_name "WARN" "WARNING")
) @comment.warning

; Error group.
(_
    . (tag
        (name) @tag_name @comment.error.name
        "("? @punctuation.bracket
        (user)? @comment.error.user
        ")"? @punctuation.bracket
        ":"? @punctuation.delimiter
    )
    (uri)? @link_uri
    (#any-of? @tag_name "BUG" "ERROR" "FIXME")
) @comment.error

# 7S-04: SIMPLE-STAR - simple_htmx

**Document**: 7S-04-SIMPLE-STAR.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## Ecosystem Integration

### Dependencies (Incoming)

None - simple_htmx is a foundation library.

### Dependents (Outgoing)

| Library | Usage |
|---------|-------|
| simple_gui_designer | Web UI generation |
| simple_web_server apps | HTML responses |

### Integration Patterns

1. **Factory Pattern**
```eiffel
local
    html: HTMX_FACTORY
    page: STRING
do
    create html
    page := html.div
        .id ("container")
        .class_ ("main")
        .containing (
            html.h1_text ("Welcome")
        )
        .containing (
            html.button_text ("Click Me")
                .hx_post ("/api/action")
                .hx_target ("#result")
        )
        .to_html
end
```

2. **HTMX Partial Pattern**
```eiffel
-- Return HTML partial for HTMX request
local
    html: HTMX_FACTORY
do
    create html
    response.send_html (
        html.div
            .id ("updated-content")
            .text ("Content updated!")
            .to_html
    )
end
```

3. **Form Generation Pattern**
```eiffel
local
    html: HTMX_FACTORY
do
    create html
    Result := html.form
        .hx_post ("/api/submit")
        .hx_target ("#result")
        .containing (html.input_text ("name"))
        .containing (html.submit_button ("Submit"))
        .to_html
end
```

### API Compatibility

- Follows simple_* naming conventions
- Fluent API throughout
- STRING output for easy integration

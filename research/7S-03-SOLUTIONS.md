# 7S-03: SOLUTIONS - simple_htmx

**Document**: 7S-03-SOLUTIONS.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## Existing Solutions Comparison

### HTML Generation Libraries

| Solution | Language | Pros | Cons |
|----------|----------|------|------|
| HtmlBuilder | Java | Fluent, typed | Wrong language |
| htmlgen | Python | Simple | Wrong language |
| jsx | JavaScript | Component model | Wrong language |
| HTML_FACTORY | Eiffel/Web | EWF integration | Different framework |
| simple_htmx | Eiffel | Native, HTMX | Limited elements |

### Why Build Our Own?

- **HTMX Focus**: First-class HTMX attribute support
- **Fluent API**: Method chaining for readability
- **Type Safety**: Each element type is a class
- **No Dependencies**: Pure Eiffel
- **Ecosystem Fit**: Works with simple_web_server

## Design Decisions

1. **Class Per Element**: HTMX_DIV, HTMX_BUTTON, etc.
2. **Deferred Base**: HTMX_ELEMENT is deferred
3. **Fluent Pattern**: All setters return Current
4. **Factory Class**: HTMX_FACTORY for creation
5. **Raw Attributes**: Support for unescaped values

## Trade-offs

- Limited element set (common ones only)
- No validation of HTMX attribute values
- String-based attribute values
- No HTML parsing

## Recommendation

Use simple_htmx for:
- Server-side HTML generation
- HTMX-powered web applications
- Dynamic partial responses
- Form generation

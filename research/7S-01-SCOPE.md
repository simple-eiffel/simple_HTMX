# 7S-01: SCOPE - simple_htmx

**Document**: 7S-01-SCOPE.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## Problem Domain

simple_htmx provides HTML generation with HTMX attributes for Eiffel web applications:

1. **HTML Element Generation** - Fluent API for building HTML
2. **HTMX Integration** - Built-in HTMX attribute support
3. **Type-Safe Building** - Compile-time element type checking
4. **Factory Pattern** - Easy element creation

## Target Users

- **Web Application Developers**: Building HTMX-powered web apps
- **Server-Side Rendering**: Generating HTML from Eiffel
- **API Developers**: Creating HTML partials for HTMX responses
- **GUI Designer**: Powers simple_gui_designer UI

## Boundaries

### In Scope
- HTML element classes (div, span, button, form, etc.)
- HTMX attributes (hx-get, hx-post, hx-target, hx-swap, etc.)
- Standard HTML attributes (id, class, style, etc.)
- Fluent builder API
- Element nesting
- HTML string generation

### Out of Scope
- JavaScript generation
- CSS generation
- HTML parsing (generation only)
- Client-side validation
- WebSocket handling

## Dependencies

- EiffelStudio kernel libraries only

## Integration Points

- HTMX_FACTORY for element creation
- HTMX_ELEMENT hierarchy for elements
- to_html for string generation

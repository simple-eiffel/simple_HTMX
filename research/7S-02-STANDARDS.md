# 7S-02: STANDARDS - simple_htmx

**Document**: 7S-02-STANDARDS.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## Applicable Standards

### HTML5

1. **W3C HTML5 Specification**
   - Reference: https://html.spec.whatwg.org/
   - Element syntax
   - Attribute syntax
   - Void elements (br, hr, img, input)
   - Character escaping

### HTMX

1. **HTMX Documentation**
   - Reference: https://htmx.org/reference/
   - hx-get, hx-post, hx-put, hx-patch, hx-delete
   - hx-target, hx-swap, hx-trigger
   - hx-include, hx-select, hx-push-url
   - hx-indicator, hx-confirm, hx-vals

### CSS

1. **Class Attribute**
   - Space-separated class names
   - Order preserved

## Supported Elements

### Container Elements
- div, span, p, h1-h5

### Form Elements
- form, input, textarea, select, option, label, button

### Table Elements
- table, thead, tbody, tfoot, tr, th, td

### List Elements
- ul, ol, li

### Other Elements
- a (anchor), img, br, hr

## Implementation Compliance

| Standard | Compliance Level | Notes |
|----------|------------------|-------|
| HTML5 Elements | Partial | Common elements |
| HTML5 Attributes | Full | Standard + custom |
| HTMX Attributes | Full | All major attributes |
| Character Escaping | Full | &, <, >, " |

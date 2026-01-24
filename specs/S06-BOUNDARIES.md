# S06: BOUNDARIES - simple_htmx

**Document**: S06-BOUNDARIES.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## System Boundaries

```
+---------------------------------------------+
|              Application Layer              |
|    (Web server, response handlers)          |
+---------------------------------------------+
                     |
                     v
+---------------------------------------------+
|              simple_htmx                    |
|  +---------------+  +-------------------+   |
|  | HTMX_FACTORY  |  | HTMX_ELEMENT      |   |
|  | (creation)    |  | (base class)      |   |
|  +---------------+  +-------------------+   |
|  +---------------------------------------+  |
|  |          Element Classes              |  |
|  | HTMX_DIV, HTMX_BUTTON, HTMX_FORM... |  |
|  +---------------------------------------+  |
+---------------------------------------------+
                     |
                     v
+---------------------------------------------+
|              HTML String Output             |
|    (sent to browser via HTTP)               |
+---------------------------------------------+
                     |
                     v
+---------------------------------------------+
|              Web Browser                    |
|    (HTMX library processes attributes)      |
+---------------------------------------------+
```

## Interface Boundaries

### Public API (Exported to ANY)

- HTMX_FACTORY: All creation methods
- HTMX_ELEMENT: All attribute and content methods
- All element classes: Specific element methods
- to_html, to_html_8: Output methods

### Internal Implementation (NONE export)

- append_attributes: HTML building
- append_content: Content rendering
- escape_html: Escaping logic

## Data Boundaries

### Input
- Strings for attributes and content
- HTMX_ELEMENT objects for children
- Arrays for bulk operations

### Output
- STRING_32 or STRING_8 HTML
- Self-contained (no external references)

## Trust Boundaries

```
+------------------+
| Application Code |  <-- Trusted (builds HTML)
+------------------+
         |
         v
+------------------+
| simple_htmx      |  <-- Escapes attributes
+------------------+
         |
         v
+------------------+
| HTML String      |  <-- Trusted output
+------------------+
         |
         v
+------------------+
| Browser/HTMX     |  <-- Renders/executes
+------------------+
```

- Application responsible for content trust
- simple_htmx escapes normal attributes
- Raw attributes bypass escaping

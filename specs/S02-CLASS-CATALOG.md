# S02: CLASS CATALOG - simple_htmx

**Document**: S02-CLASS-CATALOG.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## Core Classes

| Class | Type | Description |
|-------|------|-------------|
| HTMX_ELEMENT | Deferred | Base class for all elements |
| HTMX_FACTORY | Effective | Factory for creating elements |
| HTMX_RENDER_CONTEXT | Effective | Render context utilities |

## Element Classes

### Container Elements
| Class | Tag | Description |
|-------|-----|-------------|
| HTMX_DIV | div | Block container |
| HTMX_SPAN | span | Inline container |
| HTMX_P | p | Paragraph |

### Heading Elements
| Class | Tag | Description |
|-------|-----|-------------|
| HTMX_H1 | h1 | Heading level 1 |
| HTMX_H2 | h2 | Heading level 2 |
| HTMX_H3 | h3 | Heading level 3 |
| HTMX_H4 | h4 | Heading level 4 |
| HTMX_H5 | h5 | Heading level 5 |

### Form Elements
| Class | Tag | Description |
|-------|-----|-------------|
| HTMX_FORM | form | Form container |
| HTMX_INPUT | input | Input field (void) |
| HTMX_TEXTAREA | textarea | Multi-line input |
| HTMX_SELECT | select | Dropdown |
| HTMX_OPTION | option | Select option |
| HTMX_LABEL | label | Form label |
| HTMX_BUTTON | button | Button element |

### Table Elements
| Class | Tag | Description |
|-------|-----|-------------|
| HTMX_TABLE | table | Table container |
| HTMX_THEAD | thead | Table header |
| HTMX_TBODY | tbody | Table body |
| HTMX_TFOOT | tfoot | Table footer |
| HTMX_TR | tr | Table row |
| HTMX_TH | th | Header cell |
| HTMX_TD | td | Data cell |

### List Elements
| Class | Tag | Description |
|-------|-----|-------------|
| HTMX_UL | ul | Unordered list |
| HTMX_OL | ol | Ordered list |
| HTMX_LI | li | List item |

### Other Elements
| Class | Tag | Description |
|-------|-----|-------------|
| HTMX_A | a | Anchor/link |
| HTMX_IMG | img | Image (void) |
| HTMX_BR | br | Line break (void) |
| HTMX_HR | hr | Horizontal rule (void) |

## Inheritance

```
HTMX_ELEMENT (deferred)
├── HTMX_DIV
├── HTMX_SPAN
├── HTMX_P
├── HTMX_H1..H5
├── HTMX_FORM
├── HTMX_INPUT (void)
├── HTMX_TEXTAREA
├── HTMX_SELECT
├── HTMX_OPTION
├── HTMX_LABEL
├── HTMX_BUTTON
├── HTMX_TABLE
├── HTMX_TR, TH, TD, etc.
├── HTMX_UL, OL, LI
├── HTMX_A
├── HTMX_IMG (void)
├── HTMX_BR (void)
└── HTMX_HR (void)
```

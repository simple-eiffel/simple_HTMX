# S05: CONSTRAINTS - simple_htmx

**Document**: S05-CONSTRAINTS.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## Technical Constraints

### Element Constraints

1. **Void Elements**
   - Cannot have children: input, img, br, hr
   - `is_void_element` returns True
   - Self-closing tags: `<br/>`

2. **Non-Void Elements**
   - Can have children
   - Must have closing tag: `<div></div>`

3. **Tag Names**
   - Fixed per element class
   - Cannot be changed

### Attribute Constraints

1. **Normal Attributes**
   - Values are HTML-escaped
   - Safe for user input

2. **Raw Attributes**
   - Values NOT escaped
   - Use only with trusted content
   - For JavaScript expressions with <, >, &

3. **Classes**
   - Stored in list
   - Rendered as space-separated
   - Multiple calls add, don't replace

### Content Constraints

1. **Text Content**
   - Stored in content_text
   - NOT escaped (for flexibility)
   - Application should escape if needed

2. **Children**
   - Stored in children list
   - Only non-void elements can have children
   - Rendered in order

### Output Constraints

1. **HTML Generation**
   - Single-pass string building
   - No pretty-printing
   - UTF-32 strings (STRING_32)

2. **Encoding**
   - to_html returns STRING_32
   - to_html_8 returns STRING_8

## Platform Constraints

| Platform | Support |
|----------|---------|
| Windows | Full |
| Linux | Full |
| macOS | Full |

No platform-specific code.

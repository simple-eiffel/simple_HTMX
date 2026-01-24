# 7S-05: SECURITY - simple_htmx

**Document**: 7S-05-SECURITY.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## Security Considerations

### Attack Vectors

1. **Cross-Site Scripting (XSS)**
   - Risk: User input rendered as HTML
   - Mitigation: Automatic HTML escaping in attributes
   - Status: MITIGATED for normal attributes
   - Note: `raw_html` and `attr_raw` bypass escaping

2. **Attribute Injection**
   - Risk: Breaking out of attribute context
   - Mitigation: Quote escaping (&quot;)
   - Status: MITIGATED

3. **HTMX Target Manipulation**
   - Risk: HTMX attributes pointing to malicious URLs
   - Mitigation: Application validates URLs
   - Status: Application responsibility

### HTML Escaping

The `escape_html` feature escapes:
- `&` -> `&amp;`
- `<` -> `&lt;`
- `>` -> `&gt;`
- `"` -> `&quot;`

### Raw Attribute Warning

The `attr_raw` and `raw_html` features do NOT escape content:

```eiffel
-- SAFE: Normal attribute (escaped)
button.attr ("onclick", user_input)

-- UNSAFE: Raw attribute (not escaped)
button.attr_raw ("onclick", user_input)  -- XSS risk!
```

### Recommendations

1. **Use Normal Attributes**: Automatic escaping
2. **Validate URLs**: Check HTMX target URLs
3. **Avoid raw_html**: Unless content is trusted
4. **Sanitize Input**: Before embedding in HTML

### Known Vulnerabilities

None in library. Application must:
- Validate user input
- Not use raw_html with untrusted content

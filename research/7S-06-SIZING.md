# 7S-06: SIZING - simple_htmx

**Document**: 7S-06-SIZING.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## Implementation Size

### Source Metrics

| Directory | Files | Lines (approx) |
|-----------|-------|----------------|
| src/core/ | 3 | 700 |
| src/elements/ | 30 | 900 |
| testing/ | 3 | 200 |
| **Total** | 36 | ~1,800 |

### File Breakdown

**Core Classes:**
- htmx_element.e (590 lines) - Base class
- htmx_factory.e (310 lines) - Element factory
- htmx_render_context.e (50 lines) - Render context

**Element Classes (~30 lines each):**
- htmx_div.e, htmx_span.e
- htmx_button.e, htmx_form.e, htmx_input.e
- htmx_table.e, htmx_tr.e, htmx_td.e, htmx_th.e
- htmx_ul.e, htmx_ol.e, htmx_li.e
- htmx_h1.e through htmx_h5.e
- htmx_p.e, htmx_a.e, htmx_img.e
- htmx_br.e, htmx_hr.e
- htmx_textarea.e, htmx_select.e, htmx_option.e
- htmx_label.e
- htmx_thead.e, htmx_tbody.e, htmx_tfoot.e

### Complexity Assessment

| Component | Complexity | Rationale |
|-----------|------------|-----------|
| HTMX_ELEMENT | Medium | Many fluent methods |
| HTMX_FACTORY | Low | Simple creation |
| Element classes | Low | Just tag name |
| HTML generation | Low | String building |

### Development Effort

- **Core Classes**: 16 hours
- **Element Classes**: 8 hours
- **Testing**: 4 hours
- **Documentation**: 2 hours
- **Total**: ~30 hours

### Binary Impact

| Target | Size Impact |
|--------|-------------|
| Executable | +50-100 KB |
| No dependencies | Standalone |

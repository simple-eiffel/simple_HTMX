# SIMPLE_HTMX Roadmap

---

## Claude: Start Here

**When starting a new conversation, read this file first.**

### Session Startup

1. **Read Eiffel reference docs**: `D:/prod/reference_docs/eiffel/CLAUDE_CONTEXT.md`
2. **Review this roadmap** for project-specific context
3. **Ask**: "What would you like to work on this session?"

### Key Reference Files

| File | Purpose |
|------|---------|
| `D:/prod/reference_docs/eiffel/CLAUDE_CONTEXT.md` | Generic Eiffel knowledge |
| `D:/prod/reference_docs/eiffel/gotchas.md` | Generic Eiffel gotchas |
| `D:/prod/reference_docs/eiffel/HATS.md` | Focused work modes |
| `D:/prod/reference_docs/eiffel/patterns.md` | Verified code patterns |
| `D:/prod/reference_docs/eiffel/SIMPLE_HTMX_CREATION.md` | Library creation case study |

### Build & Test Commands

```batch
:: Compile library
TESTING_EXT="D:/prod/testing_ext" ^
  "C:\Program Files\Eiffel Software\EiffelStudio 25.02 Standard\studio\spec\win64\bin\ec.exe" ^
  -batch -config "D:\prod\simple_htmx\simple_htmx.ecf" -target simple_htmx -c_compile -freeze

:: Compile tests
TESTING_EXT="D:/prod/testing_ext" ^
  "C:\Program Files\Eiffel Software\EiffelStudio 25.02 Standard\studio\spec\win64\bin\ec.exe" ^
  -batch -config "D:\prod\simple_htmx\simple_htmx.ecf" -target simple_htmx_tests -c_compile -freeze

:: Clean compile
ec.exe -batch -config simple_htmx.ecf -target simple_htmx_tests -c_compile -freeze -clean
```

### Current Status

**Stable / Initial Release** - 30+ tests passing

Primary work now:
- Contract strengthening (Contracting Hat)
- simple_gui_designer integration (refactor to use simple_htmx)
- Additional element types as needed

---

## Project Overview

SIMPLE_HTMX is a fluent HTML and HTMX attribute builder for Eiffel web applications. Born from code smell analysis of `simple_gui_designer`, it extracts reusable HTML generation patterns into a standalone library.

### Origin Story

1. **God class refactoring**: Refactored `GUI_DESIGNER_SERVER` from 2,000 lines into 10 handler classes
2. **Code smell analysis**: Identified 12 categories of friction (string building, parameter passing, HTMX attributes)
3. **Library extraction question**: "Does it make sense to create simple_htmx?"
4. **Architecture decision**: Separate library (not in simple_web) for single responsibility
5. **Implementation**: 34 classes, 30+ tests, fluent API

See: `D:/prod/reference_docs/eiffel/SIMPLE_HTMX_CREATION.md` for the full case study.

### Design Philosophy

- **Fluent Interface (Feature Chaining)** - All methods return `like Current` for chaining
- **Type Safety** - Compiler catches HTMX attribute typos
- **Security by Default** - Automatic HTML escaping
- **Context Pattern** - Eliminate parameter threading with HTMX_RENDER_CONTEXT

---

## Current State

**Initial release complete.** The library includes:

### Core Classes (3)
- **HTMX_ELEMENT**: Base class with all HTML and HTMX attributes
- **HTMX_FACTORY**: Convenience factory for element creation
- **HTMX_RENDER_CONTEXT**: URL path builder for HTMX requests

### HTML Elements (31)
- **Containers**: div, span, p, h1, h2, h3
- **Forms**: form, input, textarea, select, option, label, button
- **Links/Media**: a, img
- **Lists**: ul, ol, li
- **Tables**: table, thead, tbody, tfoot, tr, th, td
- **Void elements**: br, hr

### HTMX Attributes (20+)
- **Requests**: hx-get, hx-post, hx-put, hx-patch, hx-delete
- **Targeting**: hx-target, hx-swap (all variants)
- **Triggers**: hx-trigger (click, change, load, revealed, custom)
- **UX**: hx-confirm, hx-indicator, hx-disable, hx-disabled-elt
- **Advanced**: hx-vals, hx-include, hx-select, hx-push-url, hx-boost

**34 classes total. 30+ tests. Production-ready.**

---

## Class Structure

```
HTMX_ELEMENT (base class)
├── HTMX_DIV, HTMX_SPAN, HTMX_P (containers)
├── HTMX_H1, HTMX_H2, HTMX_H3 (headings)
├── HTMX_FORM, HTMX_INPUT, HTMX_TEXTAREA, HTMX_SELECT, HTMX_OPTION, HTMX_LABEL, HTMX_BUTTON (forms)
├── HTMX_A, HTMX_IMG (links/media)
├── HTMX_UL, HTMX_OL, HTMX_LI (lists)
├── HTMX_TABLE, HTMX_THEAD, HTMX_TBODY, HTMX_TFOOT, HTMX_TR, HTMX_TH, HTMX_TD (tables)
└── HTMX_BR, HTMX_HR (void elements)

HTMX_FACTORY (creates all element types)

HTMX_RENDER_CONTEXT (URL path building)
```

---

## Dependencies

### Required Libraries
- **base** - Eiffel standard library

### Test Dependencies
- **testing** - EiffelStudio testing framework
- **testing_ext** - TEST_SET_BASE for tests (set `TESTING_EXT` environment variable)

### Ecosystem Libraries (consumers)
- **simple_web** - HTTP server/client (uses simple_htmx for HTML responses)
- **simple_json** - JSON handling (simple_htmx is independent)

---

## Eiffel-Specific Patterns

### VKCN(1) - Functions Used as Statements

When using fluent interfaces, the final call returns a value. If unused, Eiffel requires explicit discarding:

```eiffel
-- WRONG: Function call used as statement
l_div.class_ ("container")

-- CORRECT: Discard the result explicitly
l_div.class_ ("container").do_nothing
```

This appears throughout:
- Factory methods when result isn't assigned
- Element building across multiple statements
- Render context path building

### Hash Table Iteration

When iterating hash tables (HTMX_ELEMENT.attributes):
```eiffel
-- WRONG
across attributes as a loop
    Result.append (a.key)  -- No such feature
end

-- CORRECT
across attributes as a loop
    Result.append (attributes.key_for_iteration)
end
```

---

## Roadmap

### Phase 1 - Foundation (COMPLETE)

| Feature | Description | Status |
|---------|-------------|--------|
| **Core element base class** | HTMX_ELEMENT with all attributes | ✅ |
| **31 HTML element classes** | All common elements | ✅ |
| **Fluent interface** | Feature chaining for all methods | ✅ |
| **HTMX attributes** | 20+ type-safe HTMX methods | ✅ |
| **HTML escaping** | Automatic security | ✅ |
| **Factory class** | Convenient element creation | ✅ |
| **Render context** | URL path building | ✅ |
| **Test suite** | 30+ tests | ✅ |

### Phase 2 - Integration

| Feature | Description | Status |
|---------|-------------|--------|
| **simple_gui_designer refactor** | Replace string building with simple_htmx | Planned |
| **simple_web integration** | Document usage patterns | Planned |
| **Contract strengthening** | DBC throughout | Ongoing |

### Phase 3 - Expansion (As Needed)

| Feature | Description | Status |
|---------|-------------|--------|
| **Additional elements** | script, style, link, meta, etc. | Backlog |
| **SVG support** | SVG element classes | Backlog |
| **Templating** | Simple template mechanism | Backlog |
| **Pre-built components** | Common HTMX patterns as helpers | Backlog |

### Phase 4 - Polish

| Feature | Description | Status |
|---------|-------------|--------|
| **HTML documentation** | Docs with EIS integration | Backlog |
| **Attribute validation** | Compile-time checks where possible | Backlog |
| **Performance optimization** | String buffer pre-sizing | Backlog |

---

## Integration: simple_gui_designer

The primary consumer of simple_htmx is `simple_gui_designer`. Expected impact:

### Files to Refactor

| File | Current Size | Expected Reduction |
|------|--------------|-------------------|
| `gds_html_renderer.e` | ~17KB | 50-70% |
| `gds_static_html.e` | ~29KB | 30-50% |
| Handler classes | Various | String building eliminated |

### Pattern Replacements

| Before | After |
|--------|-------|
| 15+ `.append()` chains | Single fluent chain |
| Manual `hx-*` strings | Type-safe methods |
| Parameter threading | HTMX_RENDER_CONTEXT |
| Manual HTML escaping | Automatic |

### Migration Strategy

1. Add simple_htmx as dependency in simple_gui_designer.ecf
2. Create `html: HTMX_FACTORY` once function in handler classes
3. Replace string building in render methods one at a time
4. Replace URL building with HTMX_RENDER_CONTEXT
5. Remove obsolete helper methods

---

## API Quick Reference

### Element Creation (Factory)

```eiffel
html: HTMX_FACTORY

-- Create elements
l_div := html.div
l_btn := html.button_text ("Save")
l_input := html.input_text ("username")
l_link := html.link ("https://example.com", "Click Here")
```

### Fluent Building

```eiffel
Result := html.div
    .id ("main")
    .class_ ("container")
    .class_ ("wide")
    .data ("state", "active")
    .hx_get ("/api/data")
    .hx_target ("#result")
    .hx_swap_inner_html
    .hx_trigger ("click")
    .to_html_8
```

### Nesting Elements

```eiffel
l_header := html.div.class_ ("header").text ("Title")
l_body := html.div.class_ ("body").text ("Content")

Result := html.div.class_ ("card")
    .containing (l_header)
    .containing (l_body)
    .to_html_8
```

### URL Building (Context)

```eiffel
create ctx.make ("/api")
ctx.with_spec ("my-app").with_screen ("main").do_nothing

ctx.url_8                            -- "/api/specs/my-app/screens/main"
ctx.url_for_8 ("controls")           -- "/api/specs/my-app/screens/main/controls"
ctx.url_for_id_8 ("controls", "btn") -- "/api/specs/my-app/screens/main/controls/btn"
```

---

## Known Issues

None currently. Library is stable.

### Patterns to Avoid

1. **Forgetting `.do_nothing`** - Compiler will warn (VKCN)
2. **Using `a.key` in hash iteration** - Use `attributes.key_for_iteration`
3. **Creating elements without factory** - Works but verbose

---

## Session Notes

### 2024-12 (Library Creation)

**Task**: Create simple_htmx library from code smell analysis

**Origin**: Code smell analysis of simple_gui_designer identified:
- 20+ lines of `.do_nothing` chains
- 15+ sequential `.append()` calls per render method
- Repetitive parameter passing (spec_id, screen_id, control_id)
- Manual HTMX attribute string building

**Architecture Decision**: Separate library because:
1. Single responsibility (simple_web handles HTTP, not markup)
2. Optional dependency (not every app needs HTMX)
3. Independent evolution
4. Testability (pure functions, no server)

**Implementation**:
- 34 classes total (3 core + 31 elements)
- ~2,600 lines of code
- 30+ tests
- Full HTMX attribute coverage

**Errors Resolved**:
- VKCN(1) - Added `.do_nothing` to fluent chains
- VEEN - Fixed hash table iteration
- VD00 - Renamed testing cluster
- VTCT - Simplified APPLICATION class

**Result**: Complete library, committed and pushed to GitHub

---

## Notes

- All development follows Eiffel Design by Contract principles
- Classes use ECMA-367 standard Eiffel
- Testing via EiffelStudio AutoTest framework with TEST_SET_BASE
- Library is pure HTML generation - no HTTP dependencies

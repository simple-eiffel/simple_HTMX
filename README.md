<p align="center">
  <img src="docs/images/logo.svg" alt="simple_htmx logo" width="400">
</p>

# SIMPLE_HTMX
### Fluent HTML and HTMX Builder for Eiffel Web Applications

[![Language](https://img.shields.io/badge/language-Eiffel-blue.svg)](https://www.eiffel.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Design by Contract](https://img.shields.io/badge/DbC-enforced-orange.svg)]()
[![Void Safety](https://img.shields.io/badge/void_safety-all-brightgreen.svg)]

**[Documentation](https://simple-eiffel.github.io/simple_htmx/)**

---

## Overview

SIMPLE_HTMX is a fluent HTML and HTMX attribute builder for Eiffel web applications. It eliminates the tedious string manipulation typically required when generating HTML responses, replacing verbose `.append()` chains with a clean, type-safe, chainable API.

**Key Benefits:**
- **Fluent Interface (Feature Chaining)** - Build HTML elements with readable, chainable method calls
- **Type-Safe HTMX Attributes** - No typos in `hx-get`, `hx-post`, `hx-target`, etc.
- **Automatic HTML Escaping** - Security by default
- **Render Context** - Eliminate repetitive parameter passing for URL construction
- **31 HTML Elements** - All common HTML elements with specialized methods

**Developed using AI-assisted methodology:** Built interactively with Claude Code following rigorous Design by Contract principles.

---

## Why SIMPLE_HTMX?

### Before (Manual String Building)

```eiffel
render_control (a_control: MY_CONTROL; a_spec_id, a_screen_id: STRING_32): STRING
    do
        create Result.make (500)
        Result.append ("<div class=%"control col-")
        Result.append (a_control.col_span.out)
        Result.append (" type-")
        Result.append (a_control.control_type)
        Result.append ("%"data-id=%"")
        Result.append (a_control.id)
        Result.append ("%"draggable=%"true%"")
        Result.append ("hx-get=%"/api/properties/")
        Result.append (a_spec_id)
        Result.append ("/")
        Result.append (a_screen_id)
        Result.append ("/")
        Result.append (a_control.id)
        Result.append ("%"hx-target=%"#properties%"hx-swap=%"innerHTML%">")
        -- ... more string building
    end
```

### After (With SIMPLE_HTMX)

```eiffel
render_control (a_control: MY_CONTROL; a_ctx: HTMX_RENDER_CONTEXT): STRING
    do
        Result := html.div
            .class_ ("control")
            .class_ ("col-" + a_control.col_span.out)
            .class_ ("type-" + a_control.control_type)
            .data ("id", a_control.id)
            .attr ("draggable", "true")
            .hx_get (a_ctx.properties_url (a_control.id))
            .hx_target ("#properties")
            .hx_swap_inner_html
            .to_html_8
    end
```

**Impact:**
- 15+ lines reduced to 10 readable lines
- No manual string escaping
- Type-safe attribute names (compiler catches typos)
- Render context eliminates parameter threading
- Intention-revealing code

---

## Installation

### Add to your ECF

```xml
<library name="simple_htmx" location="$SIMPLE_EIFFEL/simple_htmx/simple_htmx.ecf"/>
```

### Environment Variable

Set the environment variable (one-time setup for all simple_* libraries):

**PowerShell:**
```powershell
[System.Environment]::SetEnvironmentVariable('SIMPLE_EIFFEL', 'D:\prod', 'User')
```

**Command Prompt:**
```batch
setx SIMPLE_EIFFEL "D:\prod"
```

### Dependencies

- **EiffelStudio 25.02+**
- **testing_ext** - For running tests (set `TESTING_EXT` environment variable)
- No other external dependencies

---

## Quick Start

### 1. Create Elements with Factory

```eiffel
class
    MY_PAGE_RENDERER

feature {NONE} -- Implementation

    html: HTMX_FACTORY
        once
            create Result
        end

feature -- Rendering

    render_button: STRING
        do
            Result := html.button_text ("Save")
                .class_ ("btn btn-primary")
                .hx_post ("/api/save")
                .hx_target ("#result")
                .hx_swap_inner_html
                .to_html_8
            -- Output: <button class="btn btn-primary" hx-post="/api/save"
            --         hx-target="#result" hx-swap="innerHTML">Save</button>
        end

    render_search_input: STRING
        do
            Result := html.input_text ("query")
                .placeholder ("Search...")
                .hx_get ("/api/search")
                .hx_trigger ("keyup changed delay:300ms")
                .hx_target ("#results")
                .hx_indicator ("#spinner")
                .to_html_8
        end
end
```

### 2. Use Render Context for URLs

```eiffel
render_control_panel (a_spec_id, a_screen_id: STRING): STRING
    local
        l_ctx: HTMX_RENDER_CONTEXT
    do
        create l_ctx.make ("/api")
        l_ctx.with_spec (a_spec_id).with_screen (a_screen_id).do_nothing

        Result := html.div.id ("panel")
            .hx_get (l_ctx.url_for_8 ("controls"))
            .hx_target ("#controls-list")
            .hx_trigger_load
            .to_html_8
        -- URL generated: /api/specs/{spec_id}/screens/{screen_id}/controls
    end
```

### 3. Nest Elements

```eiffel
render_card: STRING
    local
        l_header, l_body: HTMX_DIV
    do
        l_header := html.div.class_ ("card-header").text ("Title")
        l_body := html.div.class_ ("card-body").text ("Content here")

        Result := html.div.class_ ("card")
            .containing (l_header)
            .containing (l_body)
            .to_html_8
        -- Output: <div class="card"><div class="card-header">Title</div>
        --         <div class="card-body">Content here</div></div>
    end
```

---

## Core Classes

### HTMX_ELEMENT (Base Class)

The foundation for all HTML elements. Provides:

| Category | Methods |
|----------|---------|
| **Identity** | `id`, `name` |
| **Styling** | `class_`, `classes_from`, `style` |
| **Data** | `data`, `attr` |
| **Content** | `text`, `containing`, `with_children` |
| **Output** | `to_html`, `to_html_8` |

### HTMX Attributes

All HTMX attributes are available as type-safe methods:

| Category | Methods |
|----------|---------|
| **Requests** | `hx_get`, `hx_post`, `hx_put`, `hx_patch`, `hx_delete` |
| **Targeting** | `hx_target`, `hx_swap`, `hx_swap_inner_html`, `hx_swap_outer_html`, `hx_swap_before_end`, `hx_swap_after_end`, `hx_swap_delete` |
| **Triggers** | `hx_trigger`, `hx_trigger_click`, `hx_trigger_change`, `hx_trigger_load`, `hx_trigger_revealed` |
| **UX** | `hx_confirm`, `hx_indicator`, `hx_disable`, `hx_disabled_elt` |
| **Advanced** | `hx_vals`, `hx_include`, `hx_select`, `hx_push_url`, `hx_boost` |

### HTMX_FACTORY

Convenience factory for creating elements:

```eiffel
html: HTMX_FACTORY

-- Container elements
html.div                    -- HTMX_DIV
html.span                   -- HTMX_SPAN
html.p                      -- HTMX_P

-- Headings
html.h1, html.h2, html.h3   -- HTMX_H1, HTMX_H2, HTMX_H3

-- Form elements
html.form                   -- HTMX_FORM
html.input_text ("name")    -- HTMX_INPUT (type="text")
html.input_hidden ("k","v") -- HTMX_INPUT (type="hidden")
html.textarea ("name")      -- HTMX_TEXTAREA
html.select_ ("name")       -- HTMX_SELECT
html.button_text ("label")  -- HTMX_BUTTON

-- Links/Media
html.link ("url", "text")   -- HTMX_A
html.image ("src", "alt")   -- HTMX_IMG

-- Lists
html.ul, html.ol            -- HTMX_UL, HTMX_OL

-- Tables
html.table                  -- HTMX_TABLE
```

### HTMX_RENDER_CONTEXT

URL path builder that eliminates repetitive parameter passing:

```eiffel
-- Create context with base path
create ctx.make ("/api")

-- Build up path segments (fluent)
ctx.with_spec ("my-app").with_screen ("dashboard").do_nothing

-- Generate URLs
ctx.url_8                           -- "/api/specs/my-app/screens/dashboard"
ctx.url_for_8 ("controls")          -- "/api/specs/my-app/screens/dashboard/controls"
ctx.url_for_id_8 ("controls","btn1") -- "/api/specs/my-app/screens/dashboard/controls/btn1"
ctx.properties_url ("btn1")         -- "/api/specs/my-app/screens/dashboard/properties/btn1"

-- Non-mutating child context
child_ctx := ctx.child ("controls", "btn1")
-- ctx unchanged, child_ctx has additional segment

-- CSS selectors
ctx.target_id ("panel")             -- "#panel"
ctx.target_class ("active")         -- ".active"
```

---

## HTML Elements Reference

### Container Elements

| Class | Tag | Special Methods |
|-------|-----|-----------------|
| `HTMX_DIV` | `<div>` | Standard container |
| `HTMX_SPAN` | `<span>` | Inline container |
| `HTMX_P` | `<p>` | Paragraph |
| `HTMX_H1`, `HTMX_H2`, `HTMX_H3` | `<h1>`, `<h2>`, `<h3>` | Headings |

### Form Elements

| Class | Tag | Special Methods |
|-------|-----|-----------------|
| `HTMX_FORM` | `<form>` | `action`, `method_get`, `method_post` |
| `HTMX_INPUT` | `<input/>` | `type_`, `value`, `placeholder`, `required`, `disabled`, `readonly` |
| `HTMX_TEXTAREA` | `<textarea>` | `rows`, `cols`, `placeholder` |
| `HTMX_SELECT` | `<select>` | `option`, `option_selected` |
| `HTMX_OPTION` | `<option>` | `value`, `selected` |
| `HTMX_BUTTON` | `<button>` | `type_submit`, `type_button`, `disabled` |
| `HTMX_LABEL` | `<label>` | `for_` |

### Links and Media

| Class | Tag | Special Methods |
|-------|-----|-----------------|
| `HTMX_A` | `<a>` | `href`, `target_blank`, `rel_noopener` |
| `HTMX_IMG` | `<img/>` | `src`, `alt`, `width`, `height` |

### Lists

| Class | Tag | Special Methods |
|-------|-----|-----------------|
| `HTMX_UL` | `<ul>` | `li` (convenience) |
| `HTMX_OL` | `<ol>` | `li` (convenience) |
| `HTMX_LI` | `<li>` | Standard list item |

### Tables

| Class | Tag | Special Methods |
|-------|-----|-----------------|
| `HTMX_TABLE` | `<table>` | Standard table |
| `HTMX_THEAD` | `<thead>` | Table header |
| `HTMX_TBODY` | `<tbody>` | Table body |
| `HTMX_TFOOT` | `<tfoot>` | Table footer |
| `HTMX_TR` | `<tr>` | `th`, `td` (convenience) |
| `HTMX_TH` | `<th>` | Header cell |
| `HTMX_TD` | `<td>` | Data cell |

### Void Elements (Self-Closing)

| Class | Tag | Notes |
|-------|-----|-------|
| `HTMX_BR` | `<br/>` | Line break |
| `HTMX_HR` | `<hr/>` | Horizontal rule |
| `HTMX_IMG` | `<img/>` | Image |
| `HTMX_INPUT` | `<input/>` | Form input |

---

## Design Patterns

### Fluent Interface (Feature Chaining)

All element methods return `like Current`, enabling chaining:

```eiffel
html.div
    .id ("main")
    .class_ ("container")
    .class_ ("wide")
    .data ("state", "active")
    .hx_get ("/api/refresh")
    .hx_target ("#content")
    .hx_swap_inner_html
    .text ("Hello World")
    .to_html_8
```

**Note:** In Eiffel, when a function call is used as a statement (not assigned), you must use `.do_nothing` to discard the result:

```eiffel
-- Building up an element across multiple statements
create l_div.make
l_div.id ("main").class_ ("container").do_nothing  -- .do_nothing required
l_div.hx_get ("/api/data").do_nothing
Result := l_div.to_html_8
```

### Factory Pattern

Use `HTMX_FACTORY` for cleaner element creation:

```eiffel
feature {NONE} -- Factory

    html: HTMX_FACTORY
        once
            create Result
        end

feature -- Usage

    my_feature
        local
            l_div: HTMX_DIV
        do
            l_div := html.div.id ("test").class_ ("container")
            -- vs: create l_div.make; l_div.id ("test").class_ ("container").do_nothing
        end
```

### Context Pattern

Use `HTMX_RENDER_CONTEXT` to avoid threading URL components through every method:

```eiffel
-- Instead of:
render_control (a_control: CONTROL; a_spec_id, a_screen_id: STRING): STRING
    do
        Result := html.div
            .hx_get ("/api/specs/" + a_spec_id + "/screens/" + a_screen_id + "/controls/" + a_control.id)
            .to_html_8
    end

-- Use:
render_control (a_control: CONTROL; a_ctx: HTMX_RENDER_CONTEXT): STRING
    do
        Result := html.div
            .hx_get (a_ctx.control_url (a_control.id).to_string_8)
            .to_html_8
    end
```

---

## Integration with SIMPLE_WEB

SIMPLE_HTMX is designed to work alongside `simple_web` for complete web application development:

```
simple_web (HTTP server/routing)
     |
     +-- simple_htmx (HTML/HTMX generation) -- for web UIs
     |
     +-- simple_json (JSON handling) -- for API responses
```

### Example: Server Handler with HTMX Response

```eiffel
class
    MY_SERVER

inherit
    SIMPLE_WEB_SERVER

feature {NONE} -- Handlers

    handle_control_list (req: SIMPLE_WEB_SERVER_REQUEST; res: SIMPLE_WEB_SERVER_RESPONSE)
        local
            l_ctx: HTMX_RENDER_CONTEXT
            l_html: STRING
        do
            create l_ctx.make ("/api")
            l_ctx.with_spec (req.path_parameter ("spec_id"))
                 .with_screen (req.path_parameter ("screen_id")).do_nothing

            l_html := render_controls (l_ctx)
            res.send_html (l_html)
        end

    render_controls (a_ctx: HTMX_RENDER_CONTEXT): STRING
        local
            l_ul: HTMX_UL
        do
            l_ul := html.ul.class_ ("control-list")
            across controls as ctrl loop
                l_ul.li (ctrl.name).do_nothing
            end
            Result := l_ul.to_html_8
        end

feature {NONE} -- Factory

    html: HTMX_FACTORY
        once
            create Result
        end
end
```

---

## Testing

30+ tests covering:
- Basic element creation
- Attribute handling (id, class, data)
- HTMX attribute generation
- Form elements (input, textarea, select)
- Nested elements
- Void elements (br, hr, img)
- Tables
- Lists
- Factory methods
- Render context URL building
- HTML escaping

Run tests via EiffelStudio AutoTest.

---

## Project Structure

```
simple_htmx/
├── simple_htmx.ecf           # Library configuration
├── README.md                 # This file
├── ROADMAP.md               # Development roadmap
├── src/
│   ├── core/
│   │   ├── htmx_element.e        # Base class for all elements
│   │   ├── htmx_factory.e        # Element creation factory
│   │   └── htmx_render_context.e # URL path builder
│   └── elements/
│       ├── htmx_a.e              # Anchor/link
│       ├── htmx_br.e             # Line break
│       ├── htmx_button.e         # Button
│       ├── htmx_div.e            # Division
│       ├── htmx_form.e           # Form
│       ├── htmx_h1.e, htmx_h2.e, htmx_h3.e  # Headings
│       ├── htmx_hr.e             # Horizontal rule
│       ├── htmx_img.e            # Image
│       ├── htmx_input.e          # Form input
│       ├── htmx_label.e          # Form label
│       ├── htmx_li.e             # List item
│       ├── htmx_ol.e, htmx_ul.e  # Lists
│       ├── htmx_option.e         # Select option
│       ├── htmx_p.e              # Paragraph
│       ├── htmx_select.e         # Select dropdown
│       ├── htmx_span.e           # Span
│       ├── htmx_table.e          # Table
│       ├── htmx_tbody.e, htmx_thead.e, htmx_tfoot.e  # Table sections
│       ├── htmx_td.e, htmx_th.e, htmx_tr.e  # Table cells/rows
│       └── htmx_textarea.e       # Textarea
└── testing/
    ├── application.e             # Test application root
    └── test_htmx_elements.e      # Test suite
```

---

## Eiffel-Specific Notes

### VKCN(1) - Functions Used as Statements

When using fluent interfaces in Eiffel, the final call in a chain returns a value. If you don't need that value, Eiffel requires explicit discarding:

```eiffel
-- WRONG: Function call used as statement
l_div.class_ ("container")

-- CORRECT: Discard the result explicitly
l_div.class_ ("container").do_nothing
```

### The `do_nothing` Pattern

The `.do_nothing` pattern is Eiffel's way of saying "I'm calling this for side effects, not the return value." It's the price of feature chaining in a language with strict function/procedure separation.

**When needed:**
- Building up an element with multiple chained calls used as a statement
- Mutating render context without using the result

**When NOT needed:**
- Assigning result to a variable: `l_div := html.div.id ("main")`
- Using result directly: `Result := html.div.to_html_8`

---

## Security

### Automatic HTML Escaping

All text content and attribute values are automatically escaped:

```eiffel
html.div.text ("<script>alert('xss')</script>").to_html_8
-- Output: <div>&lt;script&gt;alert('xss')&lt;/script&gt;</div>

html.div.attr ("data-value", "foo\"bar").to_html_8
-- Output: <div data-value="foo&quot;bar"></div>
```

### Characters Escaped

| Character | Escaped As |
|-----------|------------|
| `<` | `&lt;` |
| `>` | `&gt;` |
| `&` | `&amp;` |
| `"` | `&quot;` |
| `'` | `&#39;` |

---

## Roadmap

### Completed Features
- [x] Core fluent HTML element builder (31 elements)
- [x] Full HTMX attribute support (hx-get, hx-post, hx-target, hx-swap, etc.)
- [x] Automatic HTML escaping for security
- [x] HTMX_RENDER_CONTEXT for URL path building
- [x] HTMX_FACTORY for convenient element creation
- [x] Tables, lists, forms with specialized methods
- [x] Void elements (br, hr, img, input)
- [x] 35+ comprehensive tests

### Planned Features
- [ ] Server-Sent Events (SSE) helpers
- [ ] WebSocket attribute support
- [ ] Template/partial rendering support
- [ ] Additional HTMX extensions (hyperscript, etc.)

---

## Known Issues & Fixes

### Bug Fix: raw_html Accumulation (v1.1)

**Issue**: Multiple calls to `raw_html` would overwrite content instead of accumulating.

```eiffel
-- BEFORE (broken): Only "Third" appeared
l_div.raw_html ("<span>First</span>").do_nothing
l_div.raw_html ("<span>Second</span>").do_nothing
l_div.raw_html ("<span>Third</span>").do_nothing
```

**Fix**: Changed `raw_html` to append instead of overwrite:
```eiffel
-- AFTER (fixed): All three spans appear
raw_html (a_html: READABLE_STRING_GENERAL): like Current
    do
        content_text.append (a_html.to_string_32)  -- Was: content_text := ...
        Result := Current
    end
```

**Regression test added**: `test_raw_html_multiple_calls_accumulate`

---

## License

MIT License - Copyright (c) 2024-2025, Larry Rix

---

## Acknowledgments

- Developed with Claude Code (Anthropic)
- Born from code smell analysis of `simple_gui_designer`
- Part of the `simple_*` Eiffel library ecosystem
- Design pattern: Feature Chaining (Fluent Interface)

# S01: PROJECT INVENTORY - simple_htmx

**Document**: S01-PROJECT-INVENTORY.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## Project Structure

```
simple_htmx/
├── src/
│   ├── core/
│   │   ├── htmx_element.e        -- Base element class
│   │   ├── htmx_factory.e        -- Element factory
│   │   └── htmx_render_context.e -- Render context
│   └── elements/
│       ├── htmx_div.e            -- <div>
│       ├── htmx_span.e           -- <span>
│       ├── htmx_button.e         -- <button>
│       ├── htmx_form.e           -- <form>
│       ├── htmx_input.e          -- <input>
│       ├── htmx_textarea.e       -- <textarea>
│       ├── htmx_select.e         -- <select>
│       ├── htmx_option.e         -- <option>
│       ├── htmx_label.e          -- <label>
│       ├── htmx_a.e              -- <a>
│       ├── htmx_img.e            -- <img>
│       ├── htmx_table.e          -- <table>
│       ├── htmx_thead.e          -- <thead>
│       ├── htmx_tbody.e          -- <tbody>
│       ├── htmx_tfoot.e          -- <tfoot>
│       ├── htmx_tr.e             -- <tr>
│       ├── htmx_th.e             -- <th>
│       ├── htmx_td.e             -- <td>
│       ├── htmx_ul.e             -- <ul>
│       ├── htmx_ol.e             -- <ol>
│       ├── htmx_li.e             -- <li>
│       ├── htmx_p.e              -- <p>
│       ├── htmx_h1.e - htmx_h5.e -- <h1>-<h5>
│       ├── htmx_br.e             -- <br>
│       └── htmx_hr.e             -- <hr>
├── testing/
│   ├── test_app.e                -- Test runner
│   ├── test_htmx_elements.e      -- Element tests
│   └── lib_tests.e               -- Library tests
├── research/                     -- 7S documents
├── specs/                        -- Specifications
└── simple_htmx.ecf               -- ECF configuration
```

## Source Files Summary

### Core Classes (3 files, ~700 lines)
- HTMX_ELEMENT: Base class with all attributes
- HTMX_FACTORY: Element creation methods
- HTMX_RENDER_CONTEXT: Rendering utilities

### Element Classes (~30 files, ~900 lines)
- One class per HTML element type
- Simple tag_name override
- Some with specialized features

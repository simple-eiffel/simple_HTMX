# S04: FEATURE SPECS - simple_htmx

**Document**: S04-FEATURE-SPECS.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## HTMX_ELEMENT Features

### Standard HTML Attributes
| Feature | Signature | Description |
|---------|-----------|-------------|
| id | (STRING): like Current | Set id attribute |
| class_ | (STRING): like Current | Add CSS class |
| classes_from | (STRING): like Current | Add multiple classes |
| attr | (STRING, STRING): like Current | Set any attribute |
| data | (STRING, STRING): like Current | Set data-* attribute |
| attr_raw | (STRING, STRING): like Current | Set unescaped attribute |
| style | (STRING): like Current | Set inline style |
| title | (STRING): like Current | Set title (tooltip) |
| disabled | like Current | Add disabled |
| hidden | like Current | Add hidden |

### HTMX Request Attributes
| Feature | Signature | Description |
|---------|-----------|-------------|
| hx_get | (STRING): like Current | AJAX GET |
| hx_post | (STRING): like Current | AJAX POST |
| hx_put | (STRING): like Current | AJAX PUT |
| hx_patch | (STRING): like Current | AJAX PATCH |
| hx_delete | (STRING): like Current | AJAX DELETE |

### HTMX Response Attributes
| Feature | Signature | Description |
|---------|-----------|-------------|
| hx_target | (STRING): like Current | Response target selector |
| hx_swap | (STRING): like Current | How to swap content |
| hx_swap_inner_html | like Current | Replace inner content |
| hx_swap_outer_html | like Current | Replace entire element |
| hx_swap_before_end | like Current | Append inside |
| hx_swap_after_end | like Current | Insert after |
| hx_swap_delete | like Current | Remove element |
| hx_swap_none | like Current | No swap |
| hx_select | (STRING): like Current | Select response part |

### HTMX Control Attributes
| Feature | Signature | Description |
|---------|-----------|-------------|
| hx_trigger | (STRING): like Current | When to send |
| hx_trigger_click | like Current | On click |
| hx_trigger_change | like Current | On change |
| hx_trigger_submit | like Current | On submit |
| hx_trigger_load | like Current | On page load |
| hx_indicator | (STRING): like Current | Loading indicator |
| hx_confirm | (STRING): like Current | Confirmation dialog |
| hx_disable | like Current | Disable during request |
| hx_vals | (STRING): like Current | Additional values |
| hx_include | (STRING): like Current | Include elements |
| hx_push_url | (STRING): like Current | Push to history |
| hx_push_url_true | like Current | Push request URL |

### Content
| Feature | Signature | Description |
|---------|-----------|-------------|
| text | (STRING): like Current | Set text content |
| containing | (HTMX_ELEMENT): like Current | Add child |
| with_children | (ARRAY): like Current | Add multiple children |
| raw_html | (STRING): like Current | Append raw HTML |

### Output
| Feature | Signature | Description |
|---------|-----------|-------------|
| to_html | STRING_32 | Generate HTML |
| to_html_8 | STRING_8 | Generate HTML as STRING_8 |

## HTMX_FACTORY Features

### Container Elements
| Feature | Return Type | Description |
|---------|-------------|-------------|
| div, container, block | HTMX_DIV | Create div |
| span, inline | HTMX_SPAN | Create span |
| p, paragraph | HTMX_P | Create paragraph |
| p_text | (STRING): HTMX_P | Paragraph with text |

### Headings
| Feature | Return Type | Description |
|---------|-------------|-------------|
| h1, h1_text | HTMX_H1 | Heading 1 |
| h2, h2_text | HTMX_H2 | Heading 2 |
| h3, h3_text | HTMX_H3 | Heading 3 |
| h4, h4_text | HTMX_H4 | Heading 4 |
| h5, h5_text | HTMX_H5 | Heading 5 |

### Form Elements
| Feature | Return Type | Description |
|---------|-------------|-------------|
| form | HTMX_FORM | Create form |
| input | HTMX_INPUT | Create input |
| input_text | (STRING): HTMX_INPUT | Text input |
| input_hidden | (STRING,STRING): HTMX_INPUT | Hidden input |
| textarea | (STRING): HTMX_TEXTAREA | Textarea |
| select_ | (STRING): HTMX_SELECT | Select |
| button | HTMX_BUTTON | Button |
| button_text | (STRING): HTMX_BUTTON | Button with text |
| submit_button | (STRING): HTMX_BUTTON | Submit button |
| label, label_for | HTMX_LABEL | Label |

### Tables
| Feature | Return Type | Description |
|---------|-------------|-------------|
| table, data_table | HTMX_TABLE | Table |
| thead | HTMX_THEAD | Table header |
| tbody | HTMX_TBODY | Table body |
| tr, row | HTMX_TR | Table row |
| th, header_cell | HTMX_TH | Header cell |
| td, cell | HTMX_TD | Data cell |

### Lists
| Feature | Return Type | Description |
|---------|-------------|-------------|
| ul, bullet_list | HTMX_UL | Unordered list |
| ol, numbered_list | HTMX_OL | Ordered list |
| li, list_item | HTMX_LI | List item |

### Links/Media
| Feature | Return Type | Description |
|---------|-------------|-------------|
| a, anchor | HTMX_A | Anchor |
| link | (STRING,STRING): HTMX_A | Link with href/text |
| img, image | (STRING,STRING): HTMX_IMG | Image |

### Misc
| Feature | Return Type | Description |
|---------|-------------|-------------|
| br | HTMX_BR | Line break |
| hr | HTMX_HR | Horizontal rule |

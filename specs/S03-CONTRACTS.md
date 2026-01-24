# S03: CONTRACTS - simple_htmx

**Document**: S03-CONTRACTS.md
**Library**: simple_htmx
**Status**: BACKWASH (reverse-engineered from implementation)
**Date**: 2026-01-23

---

## HTMX_ELEMENT Contracts

### Class Invariant
```eiffel
invariant
    attributes_attached: attributes /= Void
    raw_attributes_attached: raw_attributes /= Void
    classes_attached: classes /= Void
    children_attached: children /= Void
```

### Deferred Features
```eiffel
tag_name: STRING
    -- HTML tag name
    deferred
    ensure
        result_not_empty: not Result.is_empty
```

### Standard Attributes (Fluent)
```eiffel
id (a_id: READABLE_STRING_GENERAL): like Current
    ensure
        fluent_result: Result = Current
        id_set: attached attributes.item ("id") as l_id
                and then l_id.same_string_general (a_id)

class_ (a_class: READABLE_STRING_GENERAL): like Current
    ensure
        fluent_result: Result = Current
        class_added: classes.has (a_class.to_string_8)
        count_increased: classes.count = old classes.count + 1

attr (a_name: STRING; a_value: READABLE_STRING_GENERAL): like Current
    require
        name_not_empty: not a_name.is_empty
    ensure
        fluent_result: Result = Current
        attribute_set: attached attributes.item (a_name) as v
                       and then v.same_string (a_value.to_string_32)
```

### HTMX Attributes (Fluent)
```eiffel
hx_get (a_url: READABLE_STRING_GENERAL): like Current
    ensure
        fluent_result: Result = Current
        attribute_set: attached attributes.item ("hx-get") as v
                       and then v.same_string (a_url.to_string_32)

hx_target (a_selector: READABLE_STRING_GENERAL): like Current
    ensure
        fluent_result: Result = Current

hx_swap (a_mode: READABLE_STRING_GENERAL): like Current
    ensure
        fluent_result: Result = Current
```

### Content (Fluent)
```eiffel
text (a_text: READABLE_STRING_GENERAL): like Current
    ensure
        fluent_result: Result = Current
        text_set: content_text.same_string (a_text.to_string_32)

containing (a_child: HTMX_ELEMENT): like Current
    require
        not_void_element: not is_void_element
    ensure
        fluent_result: Result = Current
        child_added: children.has (a_child)
        count_increased: children.count = old children.count + 1
```

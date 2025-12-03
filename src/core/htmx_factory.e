note
	description: "[
		Factory for creating HTML/HTMX elements.

		Provides convenient shorthand for element creation.

		Example:
			html: HTMX_FACTORY
			...
			l_div := html.div.id ("main").class_ ("container")
			l_button := html.button ("Save").hx_post ("/api/save")
	]"
	author: "Claude Code"
	date: "$Date$"
	revision: "$Revision$"

class
	HTMX_FACTORY

feature -- Container Elements

	div: HTMX_DIV
			-- Create empty div.
		do
			create Result.make
		end

	span: HTMX_SPAN
			-- Create empty span.
		do
			create Result.make
		end

	p: HTMX_P
			-- Create paragraph.
		do
			create Result.make
		end

	p_text (a_text: READABLE_STRING_GENERAL): HTMX_P
			-- Create paragraph with text.
		do
			create Result.make
			Result.text (a_text).do_nothing
		end

feature -- Headings

	h1: HTMX_H1
			-- Create h1.
		do
			create Result.make
		end

	h1_text (a_text: READABLE_STRING_GENERAL): HTMX_H1
			-- Create h1 with text.
		do
			create Result.make
			Result.text (a_text).do_nothing
		end

	h2: HTMX_H2
			-- Create h2.
		do
			create Result.make
		end

	h2_text (a_text: READABLE_STRING_GENERAL): HTMX_H2
			-- Create h2 with text.
		do
			create Result.make
			Result.text (a_text).do_nothing
		end

	h3: HTMX_H3
			-- Create h3.
		do
			create Result.make
		end

	h3_text (a_text: READABLE_STRING_GENERAL): HTMX_H3
			-- Create h3 with text.
		do
			create Result.make
			Result.text (a_text).do_nothing
		end

	h4: HTMX_H4
			-- Create h4.
		do
			create Result.make
		end

	h4_text (a_text: READABLE_STRING_GENERAL): HTMX_H4
			-- Create h4 with text.
		do
			create Result.make
			Result.text (a_text).do_nothing
		end

	h5: HTMX_H5
			-- Create h5.
		do
			create Result.make
		end

	h5_text (a_text: READABLE_STRING_GENERAL): HTMX_H5
			-- Create h5 with text.
		do
			create Result.make
			Result.text (a_text).do_nothing
		end

feature -- Form Elements

	form: HTMX_FORM
			-- Create empty form.
		do
			create Result.make
		end

	input: HTMX_INPUT
			-- Create empty input.
		do
			create Result.make
		end

	input_text (a_name: READABLE_STRING_GENERAL): HTMX_INPUT
			-- Create text input with name.
		do
			create Result.make_text (a_name)
		end

	input_hidden (a_name, a_value: READABLE_STRING_GENERAL): HTMX_INPUT
			-- Create hidden input.
		do
			create Result.make_hidden (a_name, a_value)
		end

	input_number (a_name: READABLE_STRING_GENERAL): HTMX_INPUT
			-- Create number input with name.
		do
			create Result.make
			Result.type_number.name (a_name).do_nothing
		end

	textarea (a_name: READABLE_STRING_GENERAL): HTMX_TEXTAREA
			-- Create textarea with name.
		do
			create Result.make_with_name (a_name)
		end

	select_ (a_name: READABLE_STRING_GENERAL): HTMX_SELECT
			-- Create select with name.
			-- Note: named select_ to avoid conflict with Eiffel keyword.
		do
			create Result.make_with_name (a_name)
		end

	label: HTMX_LABEL
			-- Create empty label.
		do
			create Result.make
		end

	label_for (a_for_id: READABLE_STRING_GENERAL): HTMX_LABEL
			-- Create label with for attribute.
		do
			create Result.make_for (a_for_id)
		end

feature -- Buttons

	button: HTMX_BUTTON
			-- Create empty button.
		do
			create Result.make
		end

	button_text (a_text: READABLE_STRING_GENERAL): HTMX_BUTTON
			-- Create button with text.
		do
			create Result.make_with_text (a_text)
		end

	submit_button (a_text: READABLE_STRING_GENERAL): HTMX_BUTTON
			-- Create submit button.
		do
			create Result.make_with_text (a_text)
			Result.type_submit.do_nothing
		end

feature -- Links

	a: HTMX_A
			-- Create empty anchor.
		do
			create Result.make
		end

	link (a_href, a_text: READABLE_STRING_GENERAL): HTMX_A
			-- Create link with href and text.
		do
			create Result.make_link (a_href, a_text)
		end

feature -- Images

	img (a_src, a_alt: READABLE_STRING_GENERAL): HTMX_IMG
			-- Create image with src and alt.
		do
			create Result.make_src (a_src, a_alt)
		end

feature -- Lists

	ul: HTMX_UL
			-- Create unordered list.
		do
			create Result.make
		end

	ol: HTMX_OL
			-- Create ordered list.
		do
			create Result.make
		end

	li: HTMX_LI
			-- Create list item.
		do
			create Result.make
		end

feature -- Tables

	table: HTMX_TABLE
			-- Create table.
		do
			create Result.make
		end

	tr: HTMX_TR
			-- Create table row.
		do
			create Result.make
		end

	th: HTMX_TH
			-- Create table header cell.
		do
			create Result.make
		end

	td: HTMX_TD
			-- Create table data cell.
		do
			create Result.make
		end

	thead: HTMX_THEAD
			-- Create thead.
		do
			create Result.make
		end

	tbody: HTMX_TBODY
			-- Create tbody.
		do
			create Result.make
		end

feature -- Misc

	br: HTMX_BR
			-- Create line break.
		do
			create Result.make
		end

	hr: HTMX_HR
			-- Create horizontal rule.
		do
			create Result.make
		end

end

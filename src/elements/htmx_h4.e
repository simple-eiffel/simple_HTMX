note
	description: "HTML h4 heading element with HTMX support."
	author: "Claude Code"
	date: "$Date$"
	revision: "$Revision$"

class
	HTMX_H4

inherit
	HTMX_ELEMENT

create
	make

feature -- Access

	tag_name: STRING = "h4"

end

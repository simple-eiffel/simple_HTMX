note
	description: "Test application for SIMPLE_HTMX"
	author: "Larry Rix"

class
	TEST_APP

create
	make

feature {NONE} -- Initialization

	make
			-- Run the tests.
		do
			create lib_tests
			create htmx_tests
			print ("Running SIMPLE_HTMX tests...%N%N")

			passed := 0
			failed := 0

			-- LIB_TESTS
			run_test (agent lib_tests.test_div_make, "test_div_make")
			run_test (agent lib_tests.test_div_to_html, "test_div_to_html")

			-- TEST_HTMX_ELEMENTS
			run_test (agent htmx_tests.test_div_simple, "test_div_simple")
			run_test (agent htmx_tests.test_div_with_id, "test_div_with_id")
			run_test (agent htmx_tests.test_div_with_class, "test_div_with_class")
			run_test (agent htmx_tests.test_div_with_multiple_classes, "test_div_with_multiple_classes")
			run_test (agent htmx_tests.test_div_with_text, "test_div_with_text")
			run_test (agent htmx_tests.test_span_simple, "test_span_simple")
			run_test (agent htmx_tests.test_chained_attributes, "test_chained_attributes")
			run_test (agent htmx_tests.test_hx_get, "test_hx_get")
			run_test (agent htmx_tests.test_hx_post, "test_hx_post")
			run_test (agent htmx_tests.test_hx_target_and_swap, "test_hx_target_and_swap")
			run_test (agent htmx_tests.test_hx_trigger, "test_hx_trigger")
			run_test (agent htmx_tests.test_hx_confirm, "test_hx_confirm")
			run_test (agent htmx_tests.test_form_simple, "test_form_simple")
			run_test (agent htmx_tests.test_input_text, "test_input_text")
			run_test (agent htmx_tests.test_input_hidden, "test_input_hidden")
			run_test (agent htmx_tests.test_textarea, "test_textarea")
			run_test (agent htmx_tests.test_select_with_options, "test_select_with_options")
			run_test (agent htmx_tests.test_nested_elements, "test_nested_elements")
			run_test (agent htmx_tests.test_multiple_children, "test_multiple_children")
			run_test (agent htmx_tests.test_br_void_element, "test_br_void_element")

			print ("%N========================%N")
			print ("Results: " + passed.out + " passed, " + failed.out + " failed%N")

			if failed > 0 then
				print ("TESTS FAILED%N")
			else
				print ("ALL TESTS PASSED%N")
			end
		end

feature {NONE} -- Implementation

	lib_tests: LIB_TESTS
	htmx_tests: TEST_HTMX_ELEMENTS

	passed: INTEGER
	failed: INTEGER

	run_test (a_test: PROCEDURE; a_name: STRING)
			-- Run a single test and update counters.
		local
			l_retried: BOOLEAN
		do
			if not l_retried then
				a_test.call (Void)
				print ("  PASS: " + a_name + "%N")
				passed := passed + 1
			end
		rescue
			print ("  FAIL: " + a_name + "%N")
			failed := failed + 1
			l_retried := True
			retry
		end

end

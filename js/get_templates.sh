#!/bin/bash

import list_imports_of_file

function js.get_templates() {
	local file="${1?param missing - file}"
	list_imports_of_file "$file" | sed -rn "s/^text!(.*)$/\1/p"
}

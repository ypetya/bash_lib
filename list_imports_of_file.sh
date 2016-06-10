#!/bin/bash

import sed.extract_imports
import get_file_extension
import sed.extract

function list_imports_of_file() {
	local file="${1? param missing - file}"
	local extee
	get_file_extension "$file" extee
	local sed_extract="${sed_extract_imports[$extee]}"
	sed.extract sed_extract $file
}

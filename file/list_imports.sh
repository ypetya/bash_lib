#!/bin/bash

import sed.extract_imports
import file.get_extension
import sed.extract

function file.list_imports() {
	local file="${1? param missing - file}"
	local extee
	file.get_extension "$file" extee
	local sed_extract="${sed_extract_imports[$extee]}"
	sed.extract sed_extract $file
}

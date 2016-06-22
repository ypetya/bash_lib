#!/bin/bash

import sed.extract_import_vars
import file.get_extension
import sed.extract

function file.list_import_vars() {
	local file="${1? param missing - file}"
	local extee
	file.get_extension "$file" extee
	local sed_extract="${sed_extract_import_vars[$extee]}"

	case $extee in
		sh)
			sed.extract sed_extract $file | \
				sed -r 's/[a-z_]+\.([a-z_]+)/\1/g'
			;;
		js)
			sed.extract sed_extract $file | \
				tr -d '{},'
			;;
	esac
}

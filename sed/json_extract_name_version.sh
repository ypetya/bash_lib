#!/bin/bash

function sed.json_extract_name_version() {
	# 1. remove white spaces
	# 2. add enters on every object start
	# 3. eliminate line endings "name":" and "version":" and closing "
	# 4. sort
	sed -r 's/\s//g;s/[{]/\n/g' | \
	sed -r 's/[}].*$//g;s/"name":"//g;s/","version":"/:/g;s/"//g' | \
	sort
}

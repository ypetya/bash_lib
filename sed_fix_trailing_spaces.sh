#!/bin/bash

function sed_fix_trailing_spaces() {
	local file=${1? param missing - file}
	# To print:
	# sed -nr "/[[:space:]]$/p" $file
	sed -i -r "s/[[:space:]]+$//" $file
}

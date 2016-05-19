#!/bin/bash

import timer

function git_stat_line_counts() {
	timer
	# sort options:
	# -t separator
	# -k key/column
	# -g general numeric sort
	
	for file in $( git ls ) ; do
		wc -l "$file"
	done | sort -t " " -k 1 -g -r
	
	timer_stop
}

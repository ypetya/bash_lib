#!/bin/bash

import grep.blacklist
import ask_user
import user.load_config
# Example usage:
# idea $(grep.blacklist -rn 'function.*Test' | cut -d ':' -f 1)
# will open file matching function.*Test
function idea() {
	local mode="${1?param missing - filename}"
	user.load_config
	local command="$idea_exe "
	while (( $# > 0 )) ; do
		mode="$1"
		case $mode in
			open_matching)
				idea.open_matching "$2"
				return 0
				;;
			help)
				echo "available commands : open_matching"
				return 1
				;;
		esac

		command="$command $mode"
		shift
	done
	eval $command
}

# TODO create a package!
function idea.open_matching() {
	local pattern="${1?param missing -pattern to find for edit}"
	print 'Total matches '
	print yellow "$(grep.blacklist -rc "$pattern" )\n"
	for file in $(grep.blacklist -rl "$pattern" ) ; do
		if ask_user "Do you want to edit $file?" ; then
			eval "$idea_exe $file"
		fi
	done
}

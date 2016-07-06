#!/bin/bash

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

		command="$command $mode"
		shift
	done
	eval $command
}

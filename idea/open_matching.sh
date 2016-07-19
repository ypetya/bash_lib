#!/bin/bash

import grep.blacklist
import ask_user
import user.load_config

function idea.open_matching() {
	local pattern="${1?param missing -pattern to find for edit}"
	user.load_config
	print 'Total matches '
	print yellow "$(grep.blacklist -rc "$pattern" )\n"
	for file in $(grep.blacklist -rl "$pattern" ) ; do
		if ask_user "Do you want to edit $file?" ; then
			eval "$idea_exe $file"
		fi
	done
}

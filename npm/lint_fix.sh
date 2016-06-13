#!/bin/bash

import print.print print.error
import require_package
import is_file timer
import file.walk_up

function npm.lint_fix () {
	require_package npm grunt
	timer
	local dir=''

	if ! is_file package.json ; then
		dir="$(walk_up package.json)"
		pushd $dir >> /dev/null
	fi

	if ! grunt eslint:dev ; then
		error ' * eslint failed, executing eslint fix'
		npm run eslint-fix
		print yellow " * automatic fixes have been applied\n"
		if grunt eslint:dev ; then
			print green " * ok\n"
		else
			error " * there is still an error, could not resolve.\n"
			timer_stop
			return 1
		fi
	fi

	if (( ${#dir} > 0 )) ; then
		popd >> /dev/null
	fi


	timer_stop
}

alias lint_fix='npm.lint_fix'

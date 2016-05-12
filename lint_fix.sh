#!/bin/bash

require_package npm grunt

import is_file

function lint_fix () {
	if ! is_file package.json ; then 
		error 'There is no package.json in this directory!'
		return 1
	else
		if ! grunt eslint:dev ; then
			error ' * eslint failed, executing eslint fix'
			npm run eslint-fix
			print yellow " * automatic fixes have been applied!\n"
			if grunt eslint:dev ; then
				print green ok
			else
				error 'there is still an error, which can not have been resolved.'
				return 1
			fi
		fi
	fi
}

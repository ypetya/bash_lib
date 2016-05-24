#!/bin/bash

import error

if require_package npm ; then

	function npm_require_global() {
		if ! npm list "$1" 2>&1 > /dev/null ; then
			npm install "$1" -g
		fi
	}

fi

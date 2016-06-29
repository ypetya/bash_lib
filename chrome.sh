#!/bin/bash

import user.load_config

function chrome() {
	local mode="${1?param missing - mode}"
	user.load_config
	case $mode in
		dev)
			eval $chrome_exe --disable-web-security
			;;
		secure)
			eval $chrome_exe --proxy-server=$http_proxy
			;;
		incognito)
			eval $chrome_exe --incognito
			;;
		open)
			shift
			eval $chrome_exe "$@"
			;;
		*)
			echo " chrome <dev|secure|incognito|open>"
			;;
	esac
}

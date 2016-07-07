#!/bin/bash

import user.load_config

function chrome() {
	local mode="${1?param missing - mode}"
	user.load_config
	local command="$chrome_exe "
	while (( $# > 0 )) ; do
		mode="$1"
		case $mode in
			dev)
				mode="--disable-web-security"
				;;
			secure)
				mode="--proxy-server=$http_proxy"
				;;
			incognito)
				mode="--incognito"
				;;
			inbox|mail)
				mode="http://inbox.google.com"
				;;
			open)
				mode=""
				;;
			help)
				echo "try passing arguments dev|secure|incognito|mail|help"
				return 1
				;;
		esac

		command="$command $mode"
		shift
	done
	eval $command
}

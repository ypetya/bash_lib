#!/bin/bash

import load_user_config

function chrome() {
	local mode="${1?param missing - mode}"
	load_user_config
	case $mode in
		dev)
			$chrome_exe	--disable-web-security
			;;
		secure)
			$chrome_exe --proxy-server=$http_proxy
			;;
		*)
			echo " modes : dev|secure"
			;;
	esac
}

#!/bin/bash

import file.is_file
import ask_user
import print.print
import file.find_first
import is_mingw
import require_package

function load_user_config() {
	if ! is_file ~/.user_config ; then
		error "Can not find config file, creating"

		ask_user "Please enter service_endpoint" service_endpoint
		echo "service_endpoint=\"$service_endpoint\"" > ~/.user_config
		ask_user "Please enter token" token
		echo "token=\"$token\"" >> ~/.user_config

		print "Searching for chrome..\n"
		if is_mingw ; then
			echo "chrome_exe=\"$(file.find_first /c/ chrome.exe)\"" >> \
			~/.user_config
		else
			require_package chromium-browser
			echo "chrome_exe=\"$(which chromium-browser)\"" >> ~/.user_config
		fi
	fi
	source ~/.user_config
}

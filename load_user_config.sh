#!/bin/bash

import is_file
import ask_user
import print.print
import file.find_first

function load_user_config() {
	if ! is_file ~/.user_config ; then
		error "Can not find config file, creating"

		ask_user "Please enter service_endpoint" service_endpoint
		echo "service_endpoint=\"$service_endpoint\"" > ~/.user_config
		ask_user "Please enter token" token
		echo "token=\"$token\"" >> ~/.user_config
		print "Searching for chrome in /c/..\n"
		echo "chrome_exe=\"$(file.find_first /c/ chrome.exe)\"" >> ~/.user_config		
	fi
	source ~/.user_config
}

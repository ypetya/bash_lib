#!/bin/bash

import ask_user
import print.print
import file.find_first
import is_mingw
import require_package

function user.create_configs() {

	ask_user "Please enter service_endpoint" service_endpoint
	echo "service_endpoint=\"$service_endpoint\"" > ~/.user_config
	ask_user "Please enter token" token
	echo "token=\"$token\"" >> ~/.user_config

	print "Searching for chrome..\n"
	if is_mingw ; then
		echo "chrome_exe=\"$(file.find_first /c/ chrome.exe |
			sed -r 's/ /\\ /g;s/([()])/\\\1/g' )\"" >> ~/.user_config
	else
		require_package chromium-browser
		echo "chrome_exe=\"$(which chromium-browser)\"" >> ~/.user_config
	fi

	ask_user "jira_url (including string ticket_id)?" jira_url
	echo "jira_url=\"$jira_url\"" >> ~/.user_config

}

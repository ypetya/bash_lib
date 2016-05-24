#!/bin/bash

import is_file

function load_user_config() {
	if ! is_file ~/.user_config ; then
		error "Can not find config file, creating"

		ask_user "Please enter service_endpoint" service_endpoint
		echo "service_endpoint=\"$service_endpoint\"" > ~/.user_config
		ask_user "Please enter token" token
		echo "token=\"$token\"" >> ~/.user_config
	fi
	source ~/.user_config
}

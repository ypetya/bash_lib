#!/bin/bash

import print.error
import file.is_file
import user.create_configs

function user.load_config() {
	if ! is_file ~/.user_config ; then
		error "Can not find config file, creating"
		user.create_configs
	fi
	source ~/.user_config
}

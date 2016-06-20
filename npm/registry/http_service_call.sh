#!/bin/bash

import load_user_config
import http_get
import string.to_lower

function npm.registry.http_service_call() {
	local env=${1? param missing - environment}

	env=$(echo $env | string.to_lower)
	load_user_config

	http_get -vkH "$token" "${service_endpoint}$env"
	# return status
	return $?
}


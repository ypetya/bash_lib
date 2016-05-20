#!/bin/bash

import load_user_config
import http_get

function http_service_call() {
	local env=${1? param missing - environment}
	
	load_user_config

	http_get -vkH "$token" "${service_endpoint}$env"
}


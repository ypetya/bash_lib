#!/bin/bash

import npm.registry.http_service_call
import sed.json_extract_name_version

function npm.registry.fetch_versions() {
	print yellow "fetching...\n"
	local service_data
	for env in DEV UAT PROD ; do
		print "$env : "
		service_data="$(npm.registry.http_service_call $env)"
		local error="$?"
		if [ $error = "0" ] ; then
			print green 'ok\n'

			export ${env}_DEPLOY_VERSIONS="$( echo $service_data | \
			sed.json_extract_name_version )"
		else
			print red "error $error\n"
		fi
	done
}

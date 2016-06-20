#!/bin/bash

import print
import array_find
import is_variable

import npm.registry_fetch_versions

function npm.registry_get_version() {
	local package="${1? param missing - package }"
	if ! is_variable DEV_DEPLOY_VERSIONS ; then
		npm.registry_fetch_versions
	else
		print yellow "Using cached data, to clear cache use\
 npm.registry_clear_local_version_cache\n"
	fi
	local version
	for env in DEV UAT PROD ; do
		version="$(array_find "${env}_DEPLOY_VERSIONS" $package)"
		print yellow "$env"
		print " $version\n"
	done
}

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
		print yellow "using existing data, use fetch_deploy_versions\n"
	fi
	print yellow 'DEV\n'
	array_find DEV_DEPLOY_VERSIONS $package
	print yellow 'UAT\n'
	array_find UAT_DEPLOY_VERSIONS $package
	print yellow 'PROD\n'
	array_find PROD_DEPLOY_VERSIONS $package

}

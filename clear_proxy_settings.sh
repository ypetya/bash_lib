#!/bin/bash

function clear_proxy_settings() {
	local vars_to_clean="PROXY_ARGS HTTP_PROXY HTTPS_PROXY \
		http_proxy https_proxy JAVA_OPTS"
	for var in vars_to_clean; do
		unset $var
	done
}

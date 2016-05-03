#!/bin/bash

function clear_proxy_settings() {
	for var in PROXY_ARGS HTTP_PROXY HTTPS_PROXY http_proxy https_proxy JAVA_OPTS; do
		unset $var
	done	
}

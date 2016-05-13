#!/bin/bash

function http_get() {
	# set default connect timeout to 5 seconds
	local HTTP_CONNECT_TIMEOUT_IN_SEC=${HTTP_CONNECT_TIMEOUT_IN_SEC:-5}
	# -s is for silent mode ( not to output timings)
	# -L is for follow redirects
	# finally we dont want to output errors
	curl -sL --connect-timeout $HTTP_CONNECT_TIMEOUT_IN_SEC $@ 2> /dev/null
}

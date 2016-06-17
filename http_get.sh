#!/bin/bash

function http_get() {
	# set default connect timeout to 5 seconds
	local HTTP_CONNECT_TIMEOUT_IN_SEC=${HTTP_CONNECT_TIMEOUT_IN_SEC:-5}
	# -s is for silent mode ( not to output timings)
	# -L is for follow redirects
	# finally we dont want to output errors

	# TODO fix status code check
	#creates a new file descriptor 3 that redirects to 1 (STDOUT)
	#exec 3>&1
	# Run curl in a separate command, capturing output of -w "%{http_code}"
	# into HTTP_STATUS
	# and sending the content to this command's STDOUT with -o >(cat >&3)
	#local HTTP_STATUS=$(
	#	curl -sL --connect-timeout $HTTP_CONNECT_TIMEOUT_IN_SEC \
	#	-w "%{http_code}" -o >(cat >&3) "$@" 2> /dev/null)
	# return status
	#if [ ! "$HTTP_STATUS" = "200" ] ; then
	#	return $HTTP_STATUS
	#fi
	curl -sL --connect-timeout $HTTP_CONNECT_TIMEOUT_IN_SEC "$@" 2> /dev/null
}

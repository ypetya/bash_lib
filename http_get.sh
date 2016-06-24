#!/bin/bash

import print.error print.debug

function http_get() {
	# set default connect timeout to 5 seconds
	local HTTP_CONNECT_TIMEOUT_IN_SEC=${HTTP_CONNECT_TIMEOUT_IN_SEC:-5}
	# set default transfer timeout to 10 seconds
	local HTTP_TRANSFER_TIMEOUT_IN_SEC=${HTTP_TRANSFER_TIMEOUT_IN_SEC:-10}
	
	debug "curl -sL $@ "
	# -s is for silent mode ( not to output timings)
	# -L is for follow redirects
	# finally we dont want to output errors
	local response=$( curl -sL -w "%{http_code}" \
		--connect-timeout $HTTP_CONNECT_TIMEOUT_IN_SEC \
		-m $HTTP_TRANSFER_TIMEOUT_IN_SEC "$@" \
		2> /dev/null )
	# I could use a while to parseall the headers, but this way is
	# much more simple to get the status code only
	local status="${response:${#response}-3}"
	local body=''
	if [ ${#response} -gt 3 ]; then
	  body="${response:0:${#response}-3}"
	fi

	echo "$body"

	# return err when not classed OK
	if [ ! "${status:0:1}" = "2" ] ; then
		error "Http Error, status code:${status}"
		return 1
	fi
}

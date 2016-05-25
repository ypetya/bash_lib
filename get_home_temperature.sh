#!/bin/bash

import first http_get

function get_home_temperature() {
	# below logic gets and parses a json, to find the endpoint
	# $1 - my dyndns [ no http prefix ]
	# $2 - location id
	local dns="${1? param missing - enter dns json service accesspoint}"
	local location="${2? param missing - location}"
	local endpoint=$(
		http_get "http://$dns" | \
		sed -r 's/},/\n/g;s/[\[{}\]]//g;s/"[a-z]+"://g;s/"//g' | \
		grep $location | \
		cut -d ',' -f 3)

	http_get "http://$endpoint/temp/q" | \
		grep OK | first | sed -r 's/[ {}]//g'

}

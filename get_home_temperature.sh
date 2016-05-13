#!/bin/bash

import first http_get

function get_home_temperature() {
	# below logic gets and parses a jon, to find the endpoint need to 
	# turn to $1 - my dyndns, $2 - location id
	local endpoint=$(
		http_get "http://${1? param missing - enter dyndns json service accesspoint}" | \
			sed -r 's/},/\n/g;s/[\[{}\]]//g;s/"[a-z]+"://g;s/"//g' | \
			grep ${2? param missing - enter location name} | \
			cut -d ',' -f 3)
	
	http_get "http://$endpoint/temp/q" | \
		grep OK | first | sed -r 's/[ {}]//g'
	
}

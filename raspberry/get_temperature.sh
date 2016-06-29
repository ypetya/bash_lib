#!/bin/bash

import first http.get
import raspberry.get_ip

function raspberry.get_temperature() {

	local endpoint=$(raspberry.get_ip $@)

	http.get "http://$endpoint/temp/q" | \
		grep OK | first | sed -r 's/[ {}]//g'

}

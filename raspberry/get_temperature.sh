#!/bin/bash

import first http_get
import raspberry.get_ip

function raspberry.get_temperature() {

	local endpoint=$(raspberry.get_ip $@)

	http_get "http://$endpoint/temp/q" | \
		grep OK | first | sed -r 's/[ {}]//g'

}

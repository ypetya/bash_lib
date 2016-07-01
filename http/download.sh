#!/bin/bash

import http.get
import print.print

function http.download() {
	local url="${1? param missing - url}"
	
	if http.get -O "$url" ; then
		print yellow "$url : "
		print green "ok\n"
	fi
}

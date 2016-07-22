#!/bin/bash

import http.get

function http.egeszsegkonyha() {

	case $1 in

		get_token)
			local page="$( http.get 'http://www.egeszsegkonyha.hu/index.php/kisadmin' )"
			echo "$page" | sed -n '141p;142p' | \
			sed -r 's/.*name="([^"]+).*value="([^"]+).*/\1 \2/g' | \
			sed -r 's/[=]/%3D/g;s/[ ]/=/g'
			;;
	esac
}

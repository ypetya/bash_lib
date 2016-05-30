#!/bin/bash

import first http_get

function get_idojaras() {
	# met.hu
	local met_hu='http://www.met.hu/idojaras/elorejelzes/idokep_fulek/main.php?f=all'
	http_get "$met_hu" | \
	sed -r 's/^.*(Országos előrejelzés.*\/div>).*$/::: \1/' | \
	grep ::: | \
	first | sed -r 's/(\&nbsp;|<div>|<\/div>)|onmouseout.*|[)"]//g'
}

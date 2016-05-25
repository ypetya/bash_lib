#!/bin/bash

import first http_get

function get_idojaras() {
	# met.hu
	http_get 'http://www.met.hu/idojaras/elorejelzes/\
idokep_fulek/main.php?f=all' | \
	sed -r 's/^.*(Országos előrejelzés.*\/div>).*$/::: \1/' | \
	grep ::: | \
	first | sed -r 's/(\&nbsp;|<div>|<\/div>)|onmouseout.*|[)"]//g'
}

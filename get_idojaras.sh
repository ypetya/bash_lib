#!/bin/bash

import first

function get_idojaras() {
	# met.hu
	curl -sL 'http://www.met.hu/idojaras/elorejelzes/idokep_fulek/main.php?f=all' | \
	sed -r 's/^.*(Országos előrejelzés.*\/div>).*$/::: \1/' | grep ::: | \
	first | sed -r 's/(\&nbsp;|<div>|<\/div>)|onmouseout.*|[)"]//g'
}

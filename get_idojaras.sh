#!/bin/bash

function get_idojaras() {
	# met.hu
	curl -sL 'http://www.met.hu/idojaras/elorejelzes/idokep_fulek/main.php?f=all' | sed -r 's/^.*(Országos előrejelzés.*\/div>).*$/::: \1/' | grep ::: | head -n 1 | sed -r 's/(\&nbsp;|<div>|<\/div>)|onmouseout.*|[)"]//g'
}

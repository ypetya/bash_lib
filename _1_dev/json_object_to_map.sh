#!/bin/bash

import create_map
# param $1 output var name
# on stream input, a json, example:
# { id:1, name:"abracadabra"}
function json_object_to_map() {
	while read 
	create_map ${1? param missing - please specify var name}
	$1
	sed -r 's/\{/\n/g'
}

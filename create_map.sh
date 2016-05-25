#!/bin/bash

function create_map() {
	unset "${1? missing parameter - please specify the name of \
the variable}"
	declare -gA "$1"
}

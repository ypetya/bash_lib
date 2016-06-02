#!/bin/bash

function list_get_row() {
	local row_num=${1? param missing : row_num}
	if (( $# > 1 )) ; then
		shift
		sed -n "${row_num}p" "$@"
	else
		sed -n "${row_num}p"
	fi	
}

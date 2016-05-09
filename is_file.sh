#!/bin/bash

function is_file () {
	if [ ! -f "${1? - param missing : please specify filename!}" ] ; then
		return 1
	fi
}

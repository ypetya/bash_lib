#!/bin/bash

function is_directory() {
	if [ ! -d "${1? - param missing : please specify filename!}" ] ; then
		return 1
	fi
}

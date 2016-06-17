#!/bin/bash

function file.is_directory() {
	if [ ! -d "${1? - param missing : please specify filename!}" ] ; then
		return 1
	fi
}

alias is_directory='file.is_directory'

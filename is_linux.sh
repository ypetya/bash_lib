#!/bin/bash

function is_linux() {
	if [ "$(uname)" == 'Linux' ] ; then
		return 0
	fi
	return 1
}

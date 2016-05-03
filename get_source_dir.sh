#!/bin/bash

function get_source_dir() {
	local _bash_source_DIR="${BASH_SOURCE%/*}"
	if [[ ! -d "$_bash_source_DIR" ]]; then
		_bash_source_DIR="$PWD"
	fi
	
	export ${1? param missing : please define output var name}="$_bash_source_DIR"
}

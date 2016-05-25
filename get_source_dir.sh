#!/bin/bash

function get_source_dir() {
	local output="${1? param missing : please define output var name}"
	local _bash_source_DIR="${BASH_SOURCE%/*}"
	if [[ ! -d "$_bash_source_DIR" ]]; then
		_bash_source_DIR="$PWD"
	fi

	export $output="$_bash_source_DIR"
}

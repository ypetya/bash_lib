#!/bin/bash

export grep_directory_blacklist="--exclude-dir='.git' \
--exclude-dir='dist' \
--exclude-dir='coverage' \
--exclude-dir='.svn' \
--exclude-dir='node_modules' "

function grep.directory_blacklist() {
	eval grep $grep_directory_blacklist "$@"
}

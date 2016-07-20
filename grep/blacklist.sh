#!/bin/bash

export grep_blacklist="--exclude-dir='.git' \
--exclude-dir='dist' \
--exclude-dir='coverage' \
--exclude-dir='.svn' \
--exclude-dir='.idea' \
--exclude-dir='.sass-cache' \
--exclude-dir='node_modules' \
--exclude='*min.js' \
--exclude='optimised-modules.json' \
--exclude='*min.css' \
--exclude='*min.js.map' \
--exclude='err.log' \
 "

function grep.blacklist() {
	eval grep $grep_blacklist "$@"
}

alias search='grep.blacklist -rn'

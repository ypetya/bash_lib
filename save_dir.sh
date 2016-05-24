#!/bin/bash

# The following aliases (save & show) are for saving frequently used directories
# You can save a directory using an abbreviation of your choosing.
# Eg. save_dir ms
# You can subsequently move to one of the saved directories by using cd with
# the abbreviation you chose.
# Eg. cd ms
# (Note that no '$' is necessary.)
# (I got this technique from Michael Boyle in the late 1980's at Visual Edge)
function save_dir() {
	local dir_name=${1? param missing : please provide dir_name}

	sed "/$dir_name/d" ~/.dirs 2>/dev/null > ~/.dirs1
	mv ~/.dirs1 ~/.dirs
	echo "$dir_name"=\"`pwd`\" >> ~/.dirs
	load_dirs
}

function load_dirs() {
	source ~/.dirs
}

function show_dirs() {
	cat ~/.dirs
}

# init on require
load_dirs

# set the bash option so that no '$' is required when using the above facility
shopt -s cdable_vars

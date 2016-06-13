#!/bin/bash

import file.find_first_in_parrent

# print out the directory containing the given files up on the dir-tree
function file.walk_up() {
	local file_name="${1? param missing - file_name}"
	local next_file=$(file.find_first_in_parrent "$PWD" "$file_name")
	echo "${next_file%/*}"
}


alias walk_up='file.walk_up'

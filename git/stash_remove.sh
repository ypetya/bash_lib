#!/bin/bash
#
# keep or remove stash items, input needs to be an array of 'keep' or
# 'remove' strings.
#
# example input of a 12 element stash:
#
# keep keep remove remove keep keep keep remove
#
# example debug output :
#
# removing git stash drop stash@{2}
# removing git stash drop stash@{2}
# removing git stash drop stash@{5}

import print

function git.stash_remove() {
	local remove_list=($@)
	local interactive=0
	if (( ${#remove_list} == 0 )) ; then
		interactive=1
		print yellow 'You did not specify input, entering interactive mode.\n'
		git stash list
		local list
		ask_user 'Please specify list-items to drop!
[space separated ascending numbers]' list
		#to_array
		list=($list)
		echo "${list[@]}"
		local num=0
		local head
		local max=$(git stash list | wc -l)
		for (( num=0 ; num<max ; num++ )) ; do
			head="${list[0]}"
			if [ "$head" = "$num" ] ; then
				remove_list=(${remove_list[@]} remove)
				#shift
				list=(${list[@]:1})
			else
				remove_list=(${remove_list[@]} keep)
			fi
		done
	fi

	local stash_num=0
	for remove_instruction in ${remove_list[@]} ; do

		if [ $remove_instruction == 'remove' ] ; then
			git stash drop "stash@{$stash_num}"
			continue
		fi

		let stash_num=$stash_num+1
	done

	if [ "$interactive" = "1" ] ; then
		print yellow 'Done.\n'
		git stash list
	fi
}

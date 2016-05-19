#!/bin/bash

import is_directory is_text_file list_counts_desc 
import print error
import git_changed
import timer
import git_get_committers_of_file

# returns a statistic on commited lines
# param $1 can be a file or directory, or leave it empty to work on the 
# entire subdir
function git_what_have_they_done() {
  if git_changed ; then
	error 'Please commit your changes'
	return 1
  fi
  timer
  local target="${1}"
  if is_file_in_git "$target" ; then
	git_get_committers_of_file "$target" | list_counts_desc
  else 
	local committers=()
	local files=()
	
	if is_directory "$target" ; then
		pushd "$target" >> /dev/null
	else
		pushd . >> /dev/null
	fi
	files=( $(git ls) )
	
	print 'Total files : '
	print yellow "${#files[@]}\n"
	
	declare -il processed_files=0
	
	for file in ${files[@]} ; do
		if is_text_file "$file" ; then
			committers=( $(git_get_committers_of_file $file) ${committers[@]} )
			processed_files+=1
		fi
	done
	
	print yellow "${#committers[@]}"
	print ' committed lines in '
	print yellow "$processed_files"
	print " files\n"
	
	for committer in ${committers[@]} ; do
		# to lower case
		echo "${committer,,}"
	done | list_counts_desc
	
	popd >> /dev/null
  fi
  timer_stop
}

#!/bin/bash

import print
import timer
import file.is_directory file.is_text
import list_counts_desc
import git.changed
import git.get_committers_of_file

# returns a statistic on commited lines
# param $1 can be a file or directory, or leave it empty to work on the
# entire subdir
function git.what_have_they_done() {
  if git.changed ; then
	error 'Please commit your changes'
	return 1
  fi
  timer
  local target="${1}"
  if is_file_in_git "$target" ; then
	git.get_committers_of_file "$target" | list_counts_desc
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
		if file.is_text "$file" ; then
			committers=( $(git.get_committers_of_file $file) ${committers[@]} )
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

#!/bin/bash

import is_directory is_file_in_git is_text_file list_counts_desc 
import print error
import git_changed
import timer

# returns a statistic on commited lines
# param $1 can be a file or directory, or leave it empty to work on the full repo
# FIXME make it work on full repo
function git_what_have_they_done() {
  if git_changed ; then
	error 'Please commit your changes'
	return 1
  fi
  timer
  local target="${1}"
  local extract_commiter='s/^[^@]*?(\(<)([^@]*?)(@.*)/\2/'
  if is_file_in_git "$target" ; then
    git blame $target -e -w |  sed -r "$extract_commiter" | list_counts_desc
  else 
	local commiters=()
	local files=()
	
	if is_directory "$target" ; then
		files=( $(find "$target" -maxdepth 1 -type f ) )
	else
		files=( $(find . -type f ) )
	fi
	
	# Apply blackList : lets remove ./.git/*
	for key in ${!files[@]} ; do
		if [ "${files[$key]%%./.git/*}" == "" ] ; then
			files[$key]=''
		fi
	done
	# compact
	files=(${files[@]})
	
	print 'Total files : '
	print yellow "${#files[@]}\n"
	
	local processed_files=()
	local new_commiters=()
	
	for file in ${files[@]} ; do
		if is_file_in_git "$file" && is_text_file "$file" ; then
			new_commiters=( $(git blame $file -e -w | sed -r "$extract_commiter") )
			commiters=( ${new_commiters[@]} ${commiters[@]} )
			processed_files=( ${processed_files[@]} "$file" )
		fi
	done
	
	print yellow "${#commiters[@]}"
	print ' committed lines in '
	print yellow "${#processed_files[@]}"
	print " files\n"
	
	for commiter in ${commiters[@]} ; do
		# to lower case
		echo "${commiter,,}"
	done | list_counts_desc
	
	timer_stop
  fi
}

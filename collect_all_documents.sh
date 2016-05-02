#!/bin/bash

function collect_all_documents() {
  if [ -d "$1" ] ; then
	  local root_dir=$1
	  OLD_IFS=$IFS
	  IFS=$'\n'
	  
	  files=( $(
		find $root_dir -type f \( -iname \*.docx -o -iname \*.mobi -o -iname \*.doc -o -iname \*.pdf \)\
		  -not \( -path  '*/.git/*' -o -path '*/.m2/*' -o -path '*/caches/*' -o -path '*/.svn/*' \) 2>/dev/null
		))
	  
	  for i in ${files[*]} ; do
		cp -v $i .
	  done
	  
	  IFS=$OLD_IFS  
  fi
}

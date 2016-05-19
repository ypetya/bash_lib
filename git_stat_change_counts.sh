#!/bin/bash

import timer git_log_stat create_map debug

function git_stat_change_counts() {
	timer
	local file
	local count
	declare -i count
	
	create_map change_count
	create_map lines_add
	create_map lines_remove
	
	while read -r line ; do
		#debug yellow "$line"
		file="$( echo $line | cut -d ' ' -f 3 )"

		# count file changed
		count=${change_count[$file]} 
		if [ -z $count ] ; then 
			count=0
		fi
		
		count+=1
				
		change_count[$file]=$count

		# sum lines_add
		count=${lines_add[$file]} 
		if [ -z $count ] ; then 
			count=0
		fi
		
		count+=$( echo $line | cut -d ' ' -f 1)
				
		lines_add[$file]=$count
		
		# sum lines_remove
		count=${lines_remove[$file]} 
		if [ -z $count ] ; then 
			count=0
		fi
		
		count+=$( echo $line | cut -d ' ' -f 2)
		
		lines_remove[$file]=$count
	# this will print only the matchig lines, where:
	# <added_lines_number> <remove_lines_number> <file_name>		
	done <<EOT
	$( git_log_stat --since=20.weeks | \
	sed -rn 's/^([0-9]+)\s+([0-9]+)\s+(.*)$/\1 \2 \3/p' )
EOT
	debug red "${#change_count[@]} files:"
	print "Change# lines_add lines_remove file\n"
	# print results
	for file in ${!change_count[@]} ; do
		print "${change_count[$file]} "
		print green "${lines_add[$file]}"
		print " "
		print red "${lines_remove[$file]}"
		print " $file\n"
	done | sort -t " " -k 1 -g -r
	
	timer_stop
}

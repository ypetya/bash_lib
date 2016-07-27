import timer
import git.log_stat
import create_map
import print.print print.debug
import file.is_file
import user.ask
# This function may give you back the hotspot of risks in the project
#
# it returns back statistics about files, analyzing the git history
#
# Metrics
# =======
#  * change_count
#  * lines_added
#  * lines_removed
#
# Example usage
# =============
# require git.stat_change_counts ; git.stat_change_counts --since=2.weeks
#
# TODO: it would be great to pass in sorting strategy filter
function git.stat_change_counts() {
	if [[ $# == 0 ]] ; then
		if ! user.ask "Are you sure collecting stat without limits?\
 (Eg.: --since=2.weeks)"
		then
			return 1
		fi
	fi

	timer
	local file
	local risk
	declare -i risk
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
	$( git.log_stat "$@" | \
	sed -rn 's/^([0-9]+)\s+([0-9]+)\s+(.*)$/\1 \2 \3/p' )
EOT
	debug red "${#change_count[@]} files:"
	print yellow "RISK(change x length) \
length# change# lines_add lines_remove file\n"
	# print results
	for file in ${!change_count[@]} ; do
		if is_file $file ; then
			count="$(wc -l "$file" | cut -d ' ' -f 1 )"
			# RISK
			let risk="$count*${change_count[$file]}"
			print "$risk $count ${change_count[$file]} "
			print green "${lines_add[$file]}"
			print " "
			print red "${lines_remove[$file]}"
			print " $file\n"
		fi
	done | sort -t " " -k 1 -g -r

	timer_stop
}

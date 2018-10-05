import print.print
import find.blacklist
import string.match
import user.ask

function file.rename() {
	local change_from="${1? param missing - change_from}"
	local change_to="${2? param missing - change_to}"
	local files=$( find.blacklist . -type f )
	for f in $files ; do
		if string.match $f $change_from ; then
			print red "$f"
			print " -> "
			print green "${f//$change_from/$change_to}\n"
		fi
	done

	if user.ask 'Is this correct?' ; then
		for f in $files ; do
			if string.match $f $change_from ; then
				mv -v "$f" "${f//$change_from/$change_to}"
			fi
		done
	fi
}

alias rename_files='file.rename'

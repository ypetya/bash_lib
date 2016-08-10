import print.print
import user.ask
import chrome

function git.push() {
	local PR_link=""

	while read -r line ; do
		echo ">$line"

		if [ "${line:0:15}" == "remote:   https" ] ; then
			PR_link="${line:10}"
			print green ' * PR link detected!\n'
		fi
	done <<EOT
	$( git push --porcelain $@ )
EOT

	if (( ${#PR_link} >0 )) && user.ask 'Would you like to open PR?'
	then
		print yellow ' * Opening browser...\'
		chrome open "$PR_link"
	fi
}

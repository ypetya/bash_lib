import print.print
import user.ask
import chrome

function git.push() {
	git push $@

	if (( ${#stash_url} >0 )) && user.ask 'Would you like to open in browser?'
	then
		print yellow ' * Opening browser...\'
		chrome open "$stash_url"
	fi
}

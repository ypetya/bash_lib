import print.print

# example usage :
# $ string.match_regex asdbdsafasfd sd ; yes_or_no
# => yes
function print.yes_or_no() {
	if [ "$?" == "0" ] ; then
		print yellow "yes\n"
	else
		print red "no\n"
	fi
}

alias yes_or_no='print.yes_or_no'

#!/bin/bash

import print

# example usage :
# $ string.match_regex asdbdsafasfd sd ; yes_or_no
# => yes
function yes_or_no() {
	if [ "$?" == "0" ] ; then
		print yellow "yes\n"
	else
		print red "no\n"
	fi
}

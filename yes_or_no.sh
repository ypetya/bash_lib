#!/bin/bash

import print

function yes_or_no() {
	if [ "$?" == "0" ] ; then
		print yellow "yes\n"
	else
		print red "no\n"
	fi
}

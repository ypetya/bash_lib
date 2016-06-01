#!/bin/bash

import print.print

function print.error() {
	print red "$*"
	print "\n"
}

alias error="print.error"

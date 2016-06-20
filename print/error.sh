#!/bin/bash

import print.print

function print.error() {
	print red "$*\n" >&2
}

alias error="print.error"

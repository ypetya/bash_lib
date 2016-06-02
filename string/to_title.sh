#!/bin/bash

function string.to_title() {
	local string=( ${1?param missing - string} )
	echo "${string[@]^}"
}

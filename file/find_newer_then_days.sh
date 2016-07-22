#!bin/bash
function file.find_newer_then_days() {
	local days="${1?param missing - days}"
	find . -ctime -"$days"
}

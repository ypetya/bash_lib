#!/bin/bash

import http.get

function http.dpd_info() {
	local parcel_no="${1?param missing - parcel_no}"
	local check_url="http://extranet.dpd.de/cgi-bin/delistrack?pknr=${parcel_no}&lang=en&typ=1"
	# 1. get lines
	# 2. sanitize
	http.get "$check_url" | \
		grep -e '^<td>[0-9]' | \
		sed -r 's/<[/]?t[dr][^>]*>?/ /g' |
		sed -r 's/<[/]?a[^>]*>/ /g' |
		sed -r 's/<img[^>]*>/ /g' |
		sed -r 's/<[/]?b[r]?[/]?>/ /g' |
		sed -r 's/\&nbsp;|\&bull;/ /g' |
		sed -r 's/ +/ /g'
}

alias get_dpd_info='http.dpd_info'

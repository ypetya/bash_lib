#!/bin/bash

import http_get

function get_dpd_info() {
	local parcel_no="${1?param missing - parcel_no}"
	local check_url="http://extranet.dpd.de/cgi-bin/delistrack?pknr=${parcel_no}&lang=en&typ=1"
	# 1. get lines
	# 2. sanitize
	http_get "$check_url" | \
		grep -e '^<td>[0-9]' | \
		sed -r "s/<[/]?t[dr][^>]*>?|<[/]?a[^>]*>|<img[^>]*>|<[/]?b[r]?[/]?>|\&nbsp;|\&bull;/ /g;s/ +/ /g"
}

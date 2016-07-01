#!/bin/bash

function http.positive_doodles() {
	http_get http://positivedoodles.tumblr.com/rss | 
	while xml.read tag content ; do
		if string.match "$content" "img src" ; then
			content="http${content#*http}"
			echo "${content%png*}png"
		fi 
	done
}

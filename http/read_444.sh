import http.get xml.read string.decode_html_entity

function http.read_444() {
	local tag content
	http.get 'http://444.hu/feed' |
	while xml.read tag content ; do
		if [[ "${tag:0:7}" == "![CDATA[" ]] ; then
			echo "${tag:7}" | tr -d ']' | string.decode_html_entity
		fi

		if [[ ${#content} > 2 ]] ; then
			echo $content | string.decode_html_entity
		fi
	done
}

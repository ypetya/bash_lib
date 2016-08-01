import print.yes_or_no

function proxy.is_defined() {
	(( ${#HTTP_PROXY} > 0 )) ; yes_or_no
}

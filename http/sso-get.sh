import user.config.load
function http.sso-get() {
	local url="${1? param missing - url}"
	user.config.load
	http.het -vkH "$token" "$url"
}

import npm.require_global

# example call to use directory browse, CORS and open browser:
# http-server -do --cors
function npm.start_http_server() {
	npm.require_global http-server
	~/http-server $@
}

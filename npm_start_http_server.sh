#!/bin/bash

import npm_require_global

# example call to use directory browse, CORS and open browser:
# http-server -do --cors
function npm_start_http_server() {
	npm_require_global http-server
	~/http-server $@
}

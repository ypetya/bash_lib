#!/bin/bash

source_relative npm_require_global

npm_require_global http-server

# example call to use directory browse, CORS and open browser:
# http-server -do --cors
function npm_start_http_server() {	
	~/http-server $@
}

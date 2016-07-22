import user.load_config
import http.get
import string.to_lower

function npm.registry.http_service_call() {
	local env=${1? param missing - environment}

	env=$(echo $env | string.to_lower)
	user.load_config

	http.get -vkH "$token" "${service_endpoint}$env"
	# return status
	return $?
}


import http.get

function raspberry.get_ip() {
	# below logic gets and parses a json, to find the endpoint
	# $1 - my dyndns [ no http prefix ]
	# $2 - location id
	local dns="${1? param missing - enter dns json service accesspoint}"
	local location="${2? param missing - location}"
	local endpoint=$(
		http.get "http://$dns" | \
		sed -r 's/},/\n/g;s/[\[{}\]]//g;s/"[a-z]+"://g;s/"//g' | \
		grep $location | \
		cut -d ',' -f 3)

	echo "$endpoint"
}

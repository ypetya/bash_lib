function java.mvn_test() {
	require_package mvn
	local test_filter_patter="${1?param missing test_filter_pattern}"
	#type mvn
	mvn -X -Dtest="$test_filter_pattern" test
}

alias mvn_test='java.mvn_test'

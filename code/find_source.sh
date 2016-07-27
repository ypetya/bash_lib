function code.find_source() {
	declare | grep --color=auto -i -a --context 10 $@
}
alias find_source='code.find_source'

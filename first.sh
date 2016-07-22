# returns the first $1 lines of the stream
# it can pass a filename too
# E.g: print the first 3 lines of <filename>:
# $ first 3 filename
#
function first() {
	local input=( $@ )
	local lines=${1:-1}
	head -n "$lines" "${input[@]:1}"
}

#!/bin/bash

# returns the first $1 lines of the stream
function first() {
	local lines=${1:-1}
	head -n "$lines"
}

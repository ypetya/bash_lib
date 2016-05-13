#!/bin/bash

function last() {
	local lines=${1:-1}
	tail -n "$lines"
}

#!/bin/bash

function list_functions() {
	declare -F | cut -d ' ' -f 3
}

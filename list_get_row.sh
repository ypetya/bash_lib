#!/bin/bash

function list_get_row() {
	local row_num={$1? param missing : row_num}
	sed -n "${row_num}d"
}

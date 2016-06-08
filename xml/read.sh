#!/bin/bash

import set_separator

function xml.read () {
	local tag_name="${1? param missing : please define variable for tag_name}"
	local content_name="${2? param missing : please define variable for content}"
    set_separator \>
    read -d \< "$tag_name" "$content_name"
    local ret=$?
    reset_separator
    return $ret
}

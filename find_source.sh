#!/bin/bash

function find_source() {
	declare | grep --color=auto -i -a --context 10 $@
}

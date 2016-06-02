#!/bin/bash

function sed_remove_empty_lines() {
	sed '/^$/d' $@
}

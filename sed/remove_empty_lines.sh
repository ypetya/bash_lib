#!/bin/bash

function sed.remove_empty_lines() {
	sed '/^$/d' $@
}

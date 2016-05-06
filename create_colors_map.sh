#!/bin/bash

function create_colors_map() {
	unset colors
	declare -gA colors
	
	colors[default]=0
	colors[red]=31
	colors[green]=32
	colors[yellow]=33
}

create_colors_map

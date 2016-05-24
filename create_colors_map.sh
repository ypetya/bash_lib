#!/bin/bash

import create_map

function create_colors_map() {
	create_map colors

	colors[default]=0
	colors[red]=31
	colors[green]=32
	colors[yellow]=33
}

create_colors_map

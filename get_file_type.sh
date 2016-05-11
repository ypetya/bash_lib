#!/bin/bash

function get_file_type() {
	file -b ${1? param missing - enter filename}
}

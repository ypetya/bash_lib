#!/bin/bash

import require
import list
import get_source_dir

function lib.reload() {
	local dir things

	get_source_dir dir

	things=($(list))

	require "${things[@]}"
}

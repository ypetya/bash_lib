#!/bin/bash

import grep_git list_counts_desc

function git_who_have_done_this() {
	grep_git $@ | cut -d ' ' -f 2 | list_counts_desc
}

#!/bin/bash

function git_get_changes_number() {
	git status --porcelain -uno | wc -l
}

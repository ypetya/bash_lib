#!/bin/bash

function tags() {
	git tag -l --sort="version:refname" $@
}

#!/bin/bash

export find_blacklist=" -not \( \
		  -path  '*/.git/*' \
		  -o -path '*/.m2/*' \
		  -o -path '*/caches/*' \
		  -o -path '*/.svn/*' \) "

#!/bin/bash

import tags last

function git_get_last_tag() {
	tags | last
}

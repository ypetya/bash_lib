#!/bin/bash

import for_each_file js.check_templates

function js.check_templates_exists() {
	for_each_file js.check_templates
}

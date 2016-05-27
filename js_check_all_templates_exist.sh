#!/bin/bash

import for_each_file js_check_templates

function js_check_all_templates_exist() {
	for_each_file js_check_templates
}

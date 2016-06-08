#!/bin/bash

import for_each_file js.check_templates

function js.check_all_templates_exist() {
	for_each_file js.check_templates
}

#!/bin/bash

import create_map

create_map sed_extract_comments

sed_extract_comments=(
[js]='s|^[^/]*//(.*)|\1|p'
[sh]='s/^[^#]*#(.*)/\1/p'
)

export sed_extract_comments

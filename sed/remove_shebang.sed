# replace in first line
1{s|#!/bin/bash||}
# remove empty lines in the first 3 lines
1,3{/^\s*$/d}

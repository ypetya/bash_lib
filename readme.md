Goal and contribution
=====================

Introduce very simple standalone bash script modules for highly 
reusable solutions.
The dependency framework is something similar to javascript's.

Be aware of applying

 * clean code principles
 * be SOLID

Howto
=====

Use the whole library
---------------------

in your home directory

1. Step : clone the repository

`git clone https://kisp@bitbucket.org/kisp/bash_lib.git`

2. Step : source the `.source` file from your `.bashrc`

`echo "source ~/bash_lib/.source" >> .bashrc`

That's it.

Try things standalone
---------------------

`$ source <path..>/require.sh`

Than you can source any other scripts via the require command

`$ require require_completion is_linux git_helpers git_what_have_i_done killall_java`


Tips
====

try to use variable DEBUG=1

external:

* Checks : http://www.shellcheck.net/
* Colors and formatting : http://misc.flogisoft.com/bash/tip_colors_and_formatting
* Programming style : https://github.com/progrium/bashstyle

More
----

* http://tldp.org/LDP/abs/html/
* http://wiki.bash-hackers.org/start
* http://samrowe.com/wordpress/advancing-in-the-bash-shell/
* https://google.github.io/styleguide/shell.xml

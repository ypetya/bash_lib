Goals
=====

* Introduce a very easy to use utility belt for scripting.
* Construct a highly reusable module oriented framework.
* Automatize everything.
* Try to use programming principles: clean code and SOLID
* Introduce some high level scripting technics for bash: callbacks, IoC

Howto
=====

Use the library
---------------

Clone and source it:

```
git clone https://kisp@bitbucket.org/kisp/bash_lib.git
echo "source ~/bash_lib/.source" >> .bashrc
```

That's it.

Reload module
-------------

```
require require_completion
```

Write scripts
-------------

The library contains an own Require / Import mechanism.
`require` is the human friendly tool to import a module into the scope.
when you pass one argument, it will print out the imported object type,
with `print_info` . A module can be either a variable or a function.
Each file contains exactly one module. `require` always loads the module
from the disk. The tool `import` makes the same for a script. It has a 
lazy load implementation. Passing the parameter `-f` as the first, can force
the import. When you write a script, use `import`. Both `require` and
`import` can resolve multiple parameter inputs.
Each module should have a basic description in the file.

Update my copy to the latest version
------------------------------------

Run
```
$ bash_lib_update
```

Check my code quality
---------------------

Run
```
$ bash_lib_dev_test
```

Tips
====

try to set variable `DEBUG=1` to get more information

Links
=====

External
--------

* Checks : http://www.shellcheck.net/
* Colors and formatting : http://misc.flogisoft.com/bash/tip_colors_and_formatting
* Programming style : https://github.com/progrium/bashstyle

More
----

* http://tldp.org/LDP/abs/html/
* http://wiki.bash-hackers.org/start
* http://samrowe.com/wordpress/advancing-in-the-bash-shell/
* https://google.github.io/styleguide/shell.xml

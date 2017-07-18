Goals
=====

Bash library for people who do.

* Introduce a very easy to use utility belt for scripting
* Construct a highly reusable module oriented framework, similar to js
* Automatize everything
* Try to use programming principles, where possible: clean code and SOLID
* Introduce some high level scripting technics for bash: callbacks, IoC

Howto
=====

Use the library
---------------

Clone and source it:

```
git clone http://bitbucket.org/kisp/bash_lib.git
echo "source ~/bash_lib/.source" >> .bashrc
```

That's it. Now you have functions defined in your terminal.
Try autocomplete, or list them all, with the command `list`

Reload amodule
--------------

After you have changed something, try to reload it with the
`require` command.
For example:

```
require http.get
```

Write scripts
-------------

The library contains an own Require / Import mechanism.
`require` is the human friendly tool to import a module into the scope.
when you pass one argument, it will print out the imported object type,
with `print.info` . A module can be either a variable or a function.
Each file contains exactly one module. `require` always loads the module
from the disk. The tool `import` makes the same for a script. It has a 
lazy load implementation. Passing the parameter `-f` as the first, can force
the import. When you write a script, use `import`. Both `require` and
`import` can resolve multiple parameter inputs.
Each module should have a basic description in the file.

Update my copy to the latest version
------------------------------------

Run `lib.update`. It will check the remote git repository for changes.
It updates the repo with using git stash, so you don't have to care
about local changes.

Check my code quality before commiting something new
----------------------------------------------------

Run `lib.dev_test`. It will check several points to ensure code quality.

Tips
====

* Try to set variable `DEBUG=1` to get more information.
* The command `print` can use colors by printing info.
* `import` can import a whole package (or directory)

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

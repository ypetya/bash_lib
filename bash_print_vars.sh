import print.vars

# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html

function bash_print_vars() {

    local bash_vars=(
BASH
# The full pathname used to execute the current instance of Bash.
BASHOPTS
# A colon-separated list of enabled shell options. Each word in the list is a valid argument for the -s option to the shopt builtin command (see The Shopt Builtin). The options appearing in BASHOPTS are those reported as ‘on’ by ‘shopt’. If this variable is in the environment when Bash starts up, each shell option in the list will be enabled before reading any startup files. This variable is readonly.
BASHPID
# Expands to the process ID of the current Bash process. This differs from $$ under certain circumstances, such as subshells that do not require Bash to be re-initialized.
BASH_ALIASES
# An associative array variable whose members correspond to the internal list of aliases as maintained by the alias builtin. (see Bourne Shell Builtins). Elements added to this array appear in the alias list; however, unsetting array elements currently does not cause aliases to be removed from the alias list. If BASH_ALIASES is unset, it loses its special properties, even if it is subsequently reset.
BASH_ARGC
# An array variable whose values are the number of parameters in each frame of the current bash execution call stack. The number of parameters to the current subroutine (shell function or script executed with . or source) is at the top of the stack. When a subroutine is executed, the number of parameters passed is pushed onto BASH_ARGC. The shell sets BASH_ARGC only when in extended debugging mode (see The Shopt Builtin for a description of the extdebug option to the shopt builtin).
BASH_ARGV
# An array variable containing all of the parameters in the current bash execution call stack. The final parameter of the last subroutine call is at the top of the stack; the first parameter of the initial call is at the bottom. When a subroutine is executed, the parameters supplied are pushed onto BASH_ARGV. The shell sets BASH_ARGV only when in extended debugging mode (see The Shopt Builtin for a description of the extdebug option to the shopt builtin).
BASH_CMDS
# An associative array variable whose members correspond to the internal hash table of commands as maintained by the hash builtin (see Bourne Shell Builtins). Elements added to this array appear in the hash table; however, unsetting array elements currently does not cause command names to be removed from the hash table. If BASH_CMDS is unset, it loses its special properties, even if it is subsequently reset.
BASH_COMMAND
# The command currently being executed or about to be executed, unless the shell is executing a command as the result of a trap, in which case it is the command executing at the time of the trap.
BASH_COMPAT
# The value is used to set the shell’s compatibility level. See The Shopt Builtin, for a description of the various compatibility levels and their effects. The value may be a decimal number (e.g., 4.2) or an integer (e.g., 42) corresponding to the desired compatibility level. If BASH_COMPAT is unset or set to the empty string, the compatibility level is set to the default for the current version. If BASH_COMPAT is set to a value that is not one of the valid compatibility levels, the shell prints an error message and sets the compatibility level to the default for the current version. The valid compatibility levels correspond to the compatibility options accepted by the shopt builtin described above (for example, compat42 means that 4.2 and 42 are valid values). The current version is also a valid value.

BASH_ENV
# If this variable is set when Bash is invoked to execute a shell script, its value is expanded and used as the name of a startup file to read before executing the script. See Bash Startup Files.

BASH_EXECUTION_STRING
# The command argument to the -c invocation option.

BASH_LINENO
# An array variable whose members are the line numbers in source files where each corresponding member of FUNCNAME was invoked. ${BASH_LINENO[$i]} is the line number in the source file (${BASH_SOURCE[$i+1]}) where ${FUNCNAME[$i]} was called (or ${BASH_LINENO[$i-1]} if referenced within another shell function). Use LINENO to obtain the current line number.

BASH_LOADABLES_PATH
# A colon-separated list of directories in which the shell looks for dynamically loadable builtins specified by the enable command.

BASH_REMATCH
# An array variable whose members are assigned by the ‘=~’ binary operator to the [[ conditional command (see Conditional Constructs). The element with index 0 is the portion of the string matching the entire regular expression. The element with index n is the portion of the string matching the nth parenthesized subexpression. This variable is read-only.

BASH_SOURCE
# An array variable whose members are the source filenames where the corresponding shell function names in the FUNCNAME array variable are defined. The shell function ${FUNCNAME[$i]} is defined in the file ${BASH_SOURCE[$i]} and called from ${BASH_SOURCE[$i+1]}

BASH_SUBSHELL
# Incremented by one within each subshell or subshell environment when the shell begins executing in that environment. The initial value is 0.

BASH_VERSINFO
# A readonly array variable (see Arrays) whose members hold version information for this instance of Bash. The values assigned to the array members are as follows:

BASH_VERSINFO[0]
# The major version number (the release).

BASH_VERSINFO[1]
# The minor version number (the version).

BASH_VERSINFO[2]
# The patch level.

BASH_VERSINFO[3]
# The build version.

BASH_VERSINFO[4]
# The release status (e.g., beta1).

BASH_VERSINFO[5]
# The value of MACHTYPE.

BASH_VERSION
# The version number of the current instance of Bash.

BASH_XTRACEFD
# If set to an integer corresponding to a valid file descriptor, Bash will write the trace output generated when ‘set -x’ is enabled to that file descriptor. This allows tracing output to be separated from diagnostic and error messages. The file descriptor is closed when BASH_XTRACEFD is unset or assigned a new value. Unsetting BASH_XTRACEFD or assigning it the empty string causes the trace output to be sent to the standard error. Note that setting BASH_XTRACEFD to 2 (the standard error file descriptor) and then unsetting it will result in the standard error being closed.

CHILD_MAX
# Set the number of exited child status values for the shell to remember. Bash will not allow this value to be decreased below a POSIX-mandated minimum, and there is a maximum value (currently 8192) that this may not exceed. The minimum value is system-dependent.

COLUMNS
# Used by the select command to determine the terminal width when printing selection lists. Automatically set if the checkwinsize option is enabled (see The Shopt Builtin), or in an interactive shell upon receipt of a SIGWINCH.

COMP_CWORD
# An index into ${COMP_WORDS} of the word containing the current cursor position. This variable is available only in shell functions invoked by the programmable completion facilities (see Programmable Completion).

COMP_LINE
# The current command line. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see Programmable Completion).

COMP_POINT
# The index of the current cursor position relative to the beginning of the current command. If the current cursor position is at the end of the current command, the value of this variable is equal to ${#COMP_LINE}. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see Programmable Completion).

COMP_TYPE
# Set to an integer value corresponding to the type of completion attempted that caused a completion function to be called: TAB, for normal completion, ‘?’, for listing completions after successive tabs, ‘!’, for listing alternatives on partial word completion, ‘@’, to list completions if the word is not unmodified, or ‘%’, for menu completion. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see Programmable Completion).

COMP_KEY
# The key (or final key of a key sequence) used to invoke the current completion function.

COMP_WORDBREAKS
# The set of characters that the Readline library treats as word separators when performing word completion. If COMP_WORDBREAKS is unset, it loses its special properties, even if it is subsequently reset.

COMP_WORDS
# An array variable consisting of the individual words in the current command line. The line is split into words as Readline would split it, using COMP_WORDBREAKS as described above. This variable is available only in shell functions invoked by the programmable completion facilities (see Programmable Completion).

COMPREPLY
# An array variable from which Bash reads the possible completions generated by a shell function invoked by the programmable completion facility (see Programmable Completion). Each array element contains one possible completion.

COPROC
# An array variable created to hold the file descriptors for output from and input to an unnamed coprocess (see Coprocesses).

DIRSTACK
# An array variable containing the current contents of the directory stack. Directories appear in the stack in the order they are displayed by the dirs builtin. Assigning to members of this array variable may be used to modify directories already in the stack, but the pushd and popd builtins must be used to add and remove directories. Assignment to this variable will not change the current directory. If DIRSTACK is unset, it loses its special properties, even if it is subsequently reset.

EMACS
# If Bash finds this variable in the environment when the shell starts with value ‘t’, it assumes that the shell is running in an Emacs shell buffer and disables line editing.

ENV
# Similar to BASH_ENV; used when the shell is invoked in POSIX Mode (see Bash POSIX Mode).

EUID
# The numeric effective user id of the current user. This variable is readonly.

EXECIGNORE
# A colon-separated list of shell patterns (see Pattern Matching) defining the list of filenames to be ignored by command search using PATH. Files whose full pathnames match one of these patterns are not considered executable files for the purposes of completion and command execution via PATH lookup. This does not affect the behavior of the [, test, and [[ commands. Full pathnames in the command hash table are not subject to EXECIGNORE. Use this variable to ignore shared library files that have the executable bit set, but are not executable files. The pattern matching honors the setting of the extglob shell option.

FCEDIT
# The editor used as a default by the -e option to the fc builtin command.

FIGNORE
# A colon-separated list of suffixes to ignore when performing filename completion. A filename whose suffix matches one of the entries in FIGNORE is excluded from the list of matched filenames. A sample value is ‘.o:~’

FUNCNAME
# An array variable containing the names of all shell functions currently in the execution call stack. The element with index 0 is the name of any currently-executing shell function. The bottom-most element (the one with the highest index) is "main". This variable exists only when a shell function is executing. Assignments to FUNCNAME have no effect. If FUNCNAME is unset, it loses its special properties, even if it is subsequently reset.

# This variable can be used with BASH_LINENO and BASH_SOURCE. Each element of FUNCNAME has corresponding elements in BASH_LINENO and BASH_SOURCE to describe the call stack. For instance, ${FUNCNAME[$i]} was called from the file ${BASH_SOURCE[$i+1]} at line number ${BASH_LINENO[$i]}. The caller builtin displays the current call stack using this information.

FUNCNEST
# If set to a numeric value greater than 0, defines a maximum function nesting level. Function invocations that exceed this nesting level will cause the current command to abort.

GLOBIGNORE
# A colon-separated list of patterns defining the set of filenames to be ignored by filename expansion. If a filename matched by a filename expansion pattern also matches one of the patterns in GLOBIGNORE, it is removed from the list of matches. The pattern matching honors the setting of the extglob shell option.

GROUPS
# An array variable containing the list of groups of which the current user is a member. Assignments to GROUPS have no effect. If GROUPS is unset, it loses its special properties, even if it is subsequently reset.

histchars
# Up to three characters which control history expansion, quick substitution, and tokenization (see History Interaction). The first character is the history expansion character, that is, the character which signifies the start of a history expansion, normally ‘!’. The second character is the character which signifies ‘quick substitution’ when seen as the first character on a line, normally ‘^’. The optional third character is the character which indicates that the remainder of the line is a comment when found as the first character of a word, usually ‘#’. The history comment character causes history substitution to be skipped for the remaining words on the line. It does not necessarily cause the shell parser to treat the rest of the line as a comment.

HISTCMD
# The history number, or index in the history list, of the current command. If HISTCMD is unset, it loses its special properties, even if it is subsequently reset.

HISTCONTROL
# A colon-separated list of values controlling how commands are saved on the history list. If the list of values includes ‘ignorespace’, lines which begin with a space character are not saved in the history list. A value of ‘ignoredups’ causes lines which match the previous history entry to not be saved. A value of ‘ignoreboth’ is shorthand for ‘ignorespace’ and ‘ignoredups’. A value of ‘erasedups’ causes all previous lines matching the current line to be removed from the history list before that line is saved. Any value not in the above list is ignored. If HISTCONTROL is unset, or does not include a valid value, all lines read by the shell parser are saved on the history list, subject to the value of HISTIGNORE. The second and subsequent lines of a multi-line compound command are not tested, and are added to the history regardless of the value of HISTCONTROL.

HISTFILE
# The name of the file to which the command history is saved. The default value is ~/.bash_history.

HISTFILESIZE
# The maximum number of lines contained in the history file. When this variable is assigned a value, the history file is truncated, if necessary, to contain no more than that number of lines by removing the oldest entries. The history file is also truncated to this size after writing it when a shell exits. If the value is 0, the history file is truncated to zero size. Non-numeric values and numeric values less than zero inhibit truncation. The shell sets the default value to the value of HISTSIZE after reading any startup files.

HISTIGNORE
# A colon-separated list of patterns used to decide which command lines should be saved on the history list. Each pattern is anchored at the beginning of the line and must match the complete line (no implicit ‘*’ is appended). Each pattern is tested against the line after the checks specified by HISTCONTROL are applied. In addition to the normal shell pattern matching characters, ‘&’ matches the previous history line. ‘&’ may be escaped using a backslash; the backslash is removed before attempting a match. The second and subsequent lines of a multi-line compound command are not tested, and are added to the history regardless of the value of HISTIGNORE. The pattern matching honors the setting of the extglob shell option.

# HISTIGNORE subsumes the function of HISTCONTROL. A pattern of ‘&’ is identical to ignoredups, and a pattern of ‘[ ]*’ is identical to ignorespace. Combining these two patterns, separating them with a colon, provides the functionality of ignoreboth.

HISTSIZE
# The maximum number of commands to remember on the history list. If the value is 0, commands are not saved in the history list. Numeric values less than zero result in every command being saved on the history list (there is no limit). The shell sets the default value to 500 after reading any startup files.

HISTTIMEFORMAT
# If this variable is set and not null, its value is used as a format string for strftime to print the time stamp associated with each history entry displayed by the history builtin. If this variable is set, time stamps are written to the history file so they may be preserved across shell sessions. This uses the history comment character to distinguish timestamps from other history lines.

HOSTFILE
# Contains the name of a file in the same format as /etc/hosts that should be read when the shell needs to complete a hostname. The list of possible hostname completions may be changed while the shell is running; the next time hostname completion is attempted after the value is changed, Bash adds the contents of the new file to the existing list. If HOSTFILE is set, but has no value, or does not name a readable file, Bash attempts to read /etc/hosts to obtain the list of possible hostname completions. When HOSTFILE is unset, the hostname list is cleared.

HOSTNAME
# The name of the current host.

HOSTTYPE
# A string describing the machine Bash is running on.

IGNOREEOF
# Controls the action of the shell on receipt of an EOF character as the sole input. If set, the value denotes the number of consecutive EOF characters that can be read as the first character on an input line before the shell will exit. If the variable exists but does not have a numeric value (or has no value) then the default is 10. If the variable does not exist, then EOF signifies the end of input to the shell. This is only in effect for interactive shells.

INPUTRC
# The name of the Readline initialization file, overriding the default of ~/.inputrc.

LANG
# Used to determine the locale category for any category not specifically selected with a variable starting with LC_.

LC_ALL
# This variable overrides the value of LANG and any other LC_ variable specifying a locale category.

LC_COLLATE
# This variable determines the collation order used when sorting the results of filename expansion, and determines the behavior of range expressions, equivalence classes, and collating sequences within filename expansion and pattern matching (see Filename Expansion).

LC_CTYPE
# This variable determines the interpretation of characters and the behavior of character classes within filename expansion and pattern matching (see Filename Expansion).

LC_MESSAGES
# This variable determines the locale used to translate double-quoted strings preceded by a ‘$’ (see Locale Translation).

LC_NUMERIC
# This variable determines the locale category used for number formatting.

LC_TIME
# This variable determines the locale category used for data and time formatting.

LINENO
# The line number in the script or shell function currently executing.

LINES
# Used by the select command to determine the column length for printing selection lists. Automatically set if the checkwinsize option is enabled (see The Shopt Builtin), or in an interactive shell upon receipt of a SIGWINCH.

MACHTYPE
# A string that fully describes the system type on which Bash is executing, in the standard GNU cpu-company-system format.

MAILCHECK
# How often (in seconds) that the shell should check for mail in the files specified in the MAILPATH or MAIL variables. The default is 60 seconds. When it is time to check for mail, the shell does so before displaying the primary prompt. If this variable is unset, or set to a value that is not a number greater than or equal to zero, the shell disables mail checking.

MAPFILE
# An array variable created to hold the text read by the mapfile builtin when no variable name is supplied.

OLDPWD
# The previous working directory as set by the cd builtin.

OPTERR
# If set to the value 1, Bash displays error messages generated by the getopts builtin command.

OSTYPE
# A string describing the operating system Bash is running on.

PIPESTATUS
# An array variable (see Arrays) containing a list of exit status values from the processes in the most-recently-executed foreground pipeline (which may contain only a single command).

POSIXLY_CORRECT
# If this variable is in the environment when Bash starts, the shell enters POSIX mode (see Bash POSIX Mode) before reading the startup files, as if the --posix invocation option had been supplied. If it is set while the shell is running, Bash enables POSIX mode, as if the command

# set -o posix
# had been executed.

PPID
# The process ID of the shell’s parent process. This variable is readonly.

PROMPT_COMMAND
# If set, the value is interpreted as a command to execute before the printing of each primary prompt ($PS1).

PROMPT_DIRTRIM
# If set to a number greater than zero, the value is used as the number of trailing directory components to retain when expanding the \w and \W prompt string escapes (see Controlling the Prompt). Characters removed are replaced with an ellipsis.

PS0
# The value of this parameter is expanded like PS1 and displayed by interactive shells after reading a command and before the command is executed.

PS3
# The value of this variable is used as the prompt for the select command. If this variable is not set, the select command prompts with ‘#? ’

PS4
# The value is the prompt printed before the command line is echoed when the -x option is set (see The Set Builtin). The first character of PS4 is replicated multiple times, as necessary, to indicate multiple levels of indirection. The default is ‘+ ’.

PWD
# The current working directory as set by the cd builtin.

RANDOM
# Each time this parameter is referenced, a random integer between 0 and 32767 is generated. Assigning a value to this variable seeds the random number generator.

READLINE_LINE
# The contents of the Readline line buffer, for use with ‘bind -x’ (see Bash Builtins).

READLINE_POINT
# The position of the insertion point in the Readline line buffer, for use with ‘bind -x’ (see Bash Builtins).

REPLY
# The default variable for the read builtin.

SECONDS
# This variable expands to the number of seconds since the shell was started. Assignment to this variable resets the count to the value assigned, and the expanded value becomes the value assigned plus the number of seconds since the assignment.

SHELL
# The full pathname to the shell is kept in this environment variable. If it is not set when the shell starts, Bash assigns to it the full pathname of the current user’s login shell.

SHELLOPTS
# A colon-separated list of enabled shell options. Each word in the list is a valid argument for the -o option to the set builtin command (see The Set Builtin). The options appearing in SHELLOPTS are those reported as ‘on’ by ‘set -o’. If this variable is in the environment when Bash starts up, each shell option in the list will be enabled before reading any startup files. This variable is readonly.

SHLVL
# Incremented by one each time a new instance of Bash is started. This is intended to be a count of how deeply your Bash shells are nested.

TIMEFORMAT
# The value of this parameter is used as a format string specifying how the timing information for pipelines prefixed with the time reserved word should be displayed. The ‘%’ character introduces an escape sequence that is expanded to a time value or other information. The escape sequences and their meanings are as follows; the braces denote optional portions.

# %%
# A literal ‘%’.

# %[p][l]R
# The elapsed time in seconds.

# %[p][l]U
# The number of CPU seconds spent in user mode.

# %[p][l]S
# The number of CPU seconds spent in system mode.

# %P
# The CPU percentage, computed as (%U + %S) / %R.

# The optional p is a digit specifying the precision, the number of fractional digits after a decimal point. A value of 0 causes no decimal point or fraction to be output. At most three places after the decimal point may be specified; values of p greater than 3 are changed to 3. If p is not specified, the value 3 is used.

# The optional l specifies a longer format, including minutes, of the form MMmSS.FFs. The value of p determines whether or not the fraction is included.

# If this variable is not set, Bash acts as if it had the value

# $'\nreal\t%3lR\nuser\t%3lU\nsys\t%3lS'
# If the value is null, no timing information is displayed. A trailing newline is added when the format string is displayed.

TMOUT
# If set to a value greater than zero, TMOUT is treated as the default timeout for the read builtin (see Bash Builtins). The select command (see Conditional Constructs) terminates if input does not arrive after TMOUT seconds when input is coming from a terminal.

# In an interactive shell, the value is interpreted as the number of seconds to wait for a line of input after issuing the primary prompt. Bash terminates after waiting for that number of seconds if a complete line of input does not arrive.

TMPDIR
# If set, Bash uses its value as the name of a directory in which Bash creates temporary files for the shell’s use.

UID
# The numeric real user id of the current user. This variable is readonly.
    )
    print.vars "${bash_vars[@]}"
}

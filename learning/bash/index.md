---
layout: note
title: Bash
---

# Startup files

## Different modes
- An interactive shell (used to type in commands) may be
  - a login shell (when you ssh into a system, for example), or
  - a non-login shell (when you are in `bash` and then run the `bash` command).
- A non-interactive shell (used to run a script, for example)

A non-interactive shell doesn't source any startup file. It only inherits environment variables from the shell where it is called.

An interactive non-login shell only source `~/.bashrc`

# Redirecting Output
In this case, only `~/.bashrc` is sourced.


According to http://mywiki.wooledge.org/BashFAQ/002, it is possible to swap stdin and stderr in bash:

~~~bash
output=$(command 2>&1 >/dev/null)  # Save stderr, discard stdout
output=$(command 2>&1 >/dev/tty)   # Save stderr, stdout -> terminal
output=$(command 3>&2 2>&1 1>&3-)  # Save stderr, stdout -> script's stderr
~~~

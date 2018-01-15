---
layout: note
title: Bash
---

# Redirecting Output

According to http://mywiki.wooledge.org/BashFAQ/002, it is possible to swap stdin and stderr in bash:

~~~bash
output=$(command 2>&1 >/dev/null)  # Save stderr, discard stdout
output=$(command 2>&1 >/dev/tty)   # Save stderr, stdout -> terminal
output=$(command 3>&2 2>&1 1>&3-)  # Save stderr, stdout -> script's stderr
~~~

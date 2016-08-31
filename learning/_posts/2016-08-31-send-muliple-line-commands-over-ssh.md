---
tags: [SSH]
---

~~~bash
#!/bin/sh
ssh -T usr@host <<'CMDS'
for pid in `ps aux | grep badThings | awk '{print $2}'`
do
  kill -9 $pid
done
CMDS
~~~

*NOTE* The single quotes around the first *CMDS* prevent the shell to expand
variables before sending them to the remote machine. Without it, the dollar
sign in the awk command has to be escaped to prevent expansion.

*NOTE* One cannot specify the remote shell used to execute the multiple line
commands sent by ssh. The default shell for the user "usr" will be used.


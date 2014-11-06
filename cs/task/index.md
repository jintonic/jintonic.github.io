---
layout: note
category: cs
title: task
subtitle: warrior
---

bash completion
---------------

~~~bash
alias t='task'
if [ -f /path/to/task/scripts/bash/task.sh ]; then
  source /path/to/task/scripts/bash/task.sh
  complete -o nospace -F _task t
fi
~~~

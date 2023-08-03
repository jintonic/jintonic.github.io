---
layout: note
category: cs
title: python
---

# python in cygwin

python is provided in cygwin. One can follow
[this](http://stackoverflow.com/questions/18641438/installing-pip-3-2-on-cygwin)
question in stackoverfow to install python packages.

# Libraries

## SimpleHTTPServer

The following command will serve the contents of the directory where the command is executed at port 8080:

~~~sh
python -m SimpleHTTPServer 8080
~~~

By default the server is running at port 8000. No root access is required to run this command.

# Web socket

It is used to establish a permanent connection between the web server and a client through which the server can push data to the client. There is no need to have a update loop on the client side.

# Kill script with ctrl-C when there is thread in it

<https://stackoverflow.com/questions/11815947/cannot-kill-python-script-with-ctrl-c>

# Show modules available
In python:
```py
help('modules')
```

In shell:
```sh
pydoc3 modules
```

# plotting
## xkcd style

<https://en.wikipedia.org/wiki/Xkcd>
<https://matplotlib.org/api/_as_gen/matplotlib.pyplot.xkcd.html>

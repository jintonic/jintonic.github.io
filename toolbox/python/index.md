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

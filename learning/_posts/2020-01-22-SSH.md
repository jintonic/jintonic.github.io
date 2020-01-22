---
layout: note
title: SSH
---
# Local port forwarding

The following command will forward `server.ip.address:8000` to `localhost:80`:

~~~sh
ssh -L 80:127.0.0.1:8000 server.ip.address
~~~

This can also be specified in the ssh config file:

~~~
Host servername
HostName server.ip.address
User username
LocalForward 80 127.0.0.1:8000
~~~

The port forwarding function is also available under MobaXTerm's *tools* menu.

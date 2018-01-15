---
layout: note
category: cs
title: mutt
subtitle: terminal email client
---

Forward HTML email
==================

This can be done if 'mime_forward' is enabled. However, there are some side
effects of turning 'mime_forward' on. Firstly, an email in plain text would
also be forwarded as an attachment, you cannot edit it before sending it.
Secondly, everything in the original email will be bundled into a single
package to forward, you cannot choose which one to send, which not.

If you turn 'mime_forward' off, the HTML email will be forwarded as plain text.
The receiver cannot click on links in it anymore. A [work-around][st] is to use

~~~
Esc-e   resend-message   use the current message as a template for a new one
~~~

This allows you to edit the HTML body directly. You need to change the
recipient from you to someone you want to forward to after editing the body.

[st]:http://shallowsky.com/blog/linux/mutt-fwd-attachments.html


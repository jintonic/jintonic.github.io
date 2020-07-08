---
layout: note
category: cs
title: rclone
subtitle: sync files to cloud storage
---

## Move multiple directories

```sh
rclone -P move local/  remote:/path/ --include "dir*/**" --delete-empty-src-dirs
```

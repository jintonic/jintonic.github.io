---
layout: note
category: cs
title: rclone
subtitle: sync files to cloud storage
---

## Move multiple directories

```sh
rclone -P move local/  remote:path/ --include "dir*/**" --delete-empty-src-dirs
```

## Mount remote storage as a local directory

```sh
rclone mount remote: local/ --daemon --vfs-cache-mode full
```

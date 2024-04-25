---
layout: note
category: cs
title: Git
subtitle: Distributed Version Control
---

## Remove files from index but keep the local copy untouched

```sh
# remove some.file from index, but keep the file itself untouched
git rm --cached some.file
# remove some.file from both the index and the working directory
git rm some.file
```

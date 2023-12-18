---
layout: note
category: cs
title: FFmpeg
subtitle: a command-line tool for videos and audios
---

# How to split mp3

```sh
ffmpeg -i input.mp3 -f segment -segment_time 3600 -c copy output%0d.mp3
```

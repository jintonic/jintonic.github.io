---
layout: note
category: cs
title: ImageMagick
---

# montage
Montage is used to generate an array of images. The following command will generate an album consisting of three files: `index.html`, `index_map.shtml` and `index.png`. None of them can be deleted if you expect the album works correctly.

~~~sh
montage */*.jpg index.html
~~~

# display
## Visual image directory
The following command can be used to generate a file with *visual image directory* format, which can be opened in display as an array of thumbnails. Right click on each thumbnail in display, choose *Load* and the original file will be displayed. Type `Space` to go back to the thumbnail list.

~~~sh
convert 'vid:*.jpg' index.vid
display index.vid
~~~

The following command will display the *visual image directory* directly.

~~~sh
display 'vid:*.jpg'
~~~

# Display meta data of a image

```sh
identify -verbose image_file.jpg
```

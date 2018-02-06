---
---

# Exclude fields in exporting items to BibTeX

Go to [zotero data directory](https://www.zotero.org/support/zotero_data)/translators. Edit a file named *BibTeX*. Comment out lines like

~~~javascript
  writeField("field-to-be-excluded", ...
~~~

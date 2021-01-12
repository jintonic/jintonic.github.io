Source codes of [physino.xyz](http://www.physino.xyz), research and education quanta of an experimental physicist.

# Structure

Posts are categorized to sub directories

- [career](career/)
- [learning](learning/)
- [teaching](teaching/)
- [living](living/)
- [research](research/)
- [toolbox](toolbox/)

Banners for the categories are defined globally in [_includes/banner.html](_includes/banner.html).

# Test

~~~sh
jekyll build
htmlproofer ./_site --only-4xx --check-html
~~~

# License

<https://creativecommons.org/publicdomain/zero/1.0/>
Ref.: <https://choosealicense.com/>

# To-do's

- update blog with research activities
  - publications, grant applications, LEGEND, COHERENT, PIRE activities
  - youtube, bilibili updates
  - new software updates, toward, gears, etc.
- add updated date
  - <https://zzz.buzz/2016/02/13/add-an-updated-field-to-your-jekyll-site/>
- remove category from url to make the url stable (I may rename category later)
- use collections to organize TEDTalks, books, grants, students, postdocs, talks, etc.
- use tags in collections as well
  - <https://stackoverflow.com/questions/36958975/listing-jekyll-collection-pages-by-tags>
- user cases instead of manual
  - tags, collections, categories for organization

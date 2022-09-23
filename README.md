Source code of <http://physino.xyz> that can be converted to static web pages using [Jekyll][].

[Jekyll]: https://jekyllrb.com
[Docker]: https://www.docker.com

## Docker

The website can be served locally through [Docker][]:

```sh
git clone git@github.com:jintonic/jintonic.github.io.git physino.xyz
cd physino.xyz
# run docker desktop before running the following commands
docker compose up
```

Now one can open <http://localhost:4000> in a browser and see the locally generated website.

### Ref.
- <https://dev.to/michael/compile-a-jekyll-project-without-installing-jekyll-or-ruby-by-using-docker-4184>
- <https://hub.docker.com/r/jekyll/jekyll>
- <https://docs.docker.com/compose/>

### Docker image

The Docker image used to serve the website locally is generated using the following commands:

```sh
git clone git@github.com:jintonic/jintonic.github.io.git physino.xyz
cd physino.xyz
# run docker desktop before running the following commands
# build image based on ./Dockerfile
docker-compose build
# push container to hub.docker.com
docker-compose push
```

The [Dockerfile](Dockerfile) contains only two lines:

```
from jekyll/minimal:pages
run gem cleanup && gem install webrick
```

The official [jekyll/minimal:pages](https://hub.docker.com/r/jekyll/minimal) image doesn't include the [webrick][] [gem][], which provides an http server. Without it, I can run `jekyll build`, but not `jekyll serve`. I can install it using [bundler][] for a specific ruby application or using `gem install webrick` for the whole Docker image. As this Docker image is created for the sole purpose of serving this website locally, there is no need to use [bundler][] anymore. Besides, `bundle install webrick` not only installs [webrick][], but also install a bunch of other gems in different versions from the ones installed by `gem`. [Jekyll][] gets confused by those different versions of gems. The difference between `bundle install` and `gem install` is mentioned in the following posts:

- <https://stackoverflow.com/a/6162221>
- <https://stackoverflow.com/a/11635148>

The image generated is named `physino/jekyll:pages` in [docker-compose.yml](docker-compose.yml) and shared on <https://hub.docker.com/r/physino/jekyll>.

[webrick]: https://github.com/ruby/webrick
[gem]: https://rubygems.org
[bundler]: https://bundler.io

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

## Limitation
- jekyll-pagination only works in the `index.html` file, not [index.md](index.md). jekyll-pagination-v2 does support pagination in any file, but does not work for GitHub pages. Currently, the pagination code is in [blog/index.html](blog/index.html). It does not work.
-

---
---

Blogs on teaching
=================

<ul>
  {% for post in site.categories.teaching %}
  <li>
  <a href="{{ post.url }}">{{ post.title }}</a>
  <span class="glyphicon glyphicon-time"></span>
  {{ post.date | date: "%B %-d, %Y" }}
  </li>
  {% endfor %}
</ul>

---
---

Blogs on lifestyle
==================

<ul>
  {% for post in site.categories.lifestyle %}
  <li>
  <a href="{{ post.url }}">{{ post.title }}</a>
  <span class="glyphicon glyphicon-time"></span>
  {{ post.date | date: "%B %-d, %Y" }}
  </li>
  {% endfor %}
</ul>

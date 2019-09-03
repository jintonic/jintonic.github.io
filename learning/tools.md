---
layout: page
---

<div class="well well-sm">
  <ul class="nav nav-pills">
  {% assign sorted = site.pages | sort:"path" %}
  {% for page in sorted %}
    {% if page.layout == "note" %}
      <li><a href="{{page.url}}">{{page.title}}</a></li>
    {% endif %}
  {% endfor %}
  </ul>
</div>

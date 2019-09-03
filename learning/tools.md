---
layout: page
---

<div class="well well-sm">
  <ul class="nav nav-pills">
    {% for page in site.pages %}
      {% if page.layout == "note" %}
      <li><a href="{{page.url}}">{{page.title}}</a></li>
      {% endif %} 
    {% endfor %}
  </ul>
</div>

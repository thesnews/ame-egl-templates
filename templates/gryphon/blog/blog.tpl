{# gryphon/blog/blog.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ blog.name }}{% endblock %}
{% block active %}blog{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}


{% block content %}

<div class="row">
	<div class="span8">

		{% if blog.media.length %}
			<img src="{{ blog.media[0].url }}" alt="{{ blog.name }}" title="{{ blog.name }}"/>
		{% else %}
			<h1>{{ blog.name }}</h1>
		{% endif %}
		<hr class="double spacer" />

		{% for post in posts %}
			<article>
				<h2><a href="{{ post.url }}">{{ post.headline }}</a></h2>
				<hr class="spacer" />

				<div class="highlight smaller">
					By {{ post.authors.splat('name')|join(', ') }}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Last updated: {{ post.created|timeSince }}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					{{ disqus.countlink(post) }}
				</div>
				<hr class="spacer" />
				{{ post.copy_formatted }}
				<hr class="clearfix double spacer" />
			</article>

		{% endfor %}
		<hr class="spacer" />

		<div class="pagination">
			<ul>
			{% for page in pagination %}
				{% if page.isCurrent %}
					<li class="disabled"><a href="#">{{ page.label }}</a></li>
				{% else %}
					<li><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% endif %}
			{% endfor %}
			</ul>
		</div>

	</div>

  {% include 'gryphon/main/sidebar-standard.tpl' %}
  </div>

</div>


{% endblock %}
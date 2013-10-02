{#} gryphon/search/main.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: Search{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">

		<h1>
			{% if query	%}
				Search Results for "{{ query }}"
			{% else %}
				Basic Search
			{% endif %}
		</h1>
		<hr class="spacer" />
		{% if query %}
			<p class="copy"><strong>{{ pagination.total|int2noun('item') }}</strong> found for "{{ query }}". If you're looking for something specific, you can also try an <a href="{{ 'search'|url(['a':1]) }}">Advanced Search</a>.</p>
		{% else %}
			<p class="copy">Use the field below to perform a basic search of The Eagle's archives. This will return articles, images, and multimedia relevant to your query. You can also try an <a href="{{ 'search'|url(['a':1]) }}">Advanced search</a></p>
		{% endif %}
		<hr class="spacer" />

		<form method="get" action="{{ 'gryphon:search'|url }}" class="form-inline">
			<div class="input-append">
				<input class="input-xxlarge" style ="color:#444"type="text" name="q" value="{{ query }}" placeholder="Search The Eagle" /><span class="add-on"><i class="icon-search"></i></span>
			</div>
		</form>

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

		<hr class="double hairline" />


		{% for item in hits %}
			<article class="clearfix">
				<h4><a href="{{ item.url|url }}">{{ item.title }}</a></h4>
				<div class="smaller"><em>({{ item.created|timeSince }})</em></div>

				{% if item.type == 'media' and item.misc.urlThumbnail %}
					<img src="{{ item.misc.urlThumbnail }}" style="float:left;padding: 5px 5px 5px 0;" />
				{% endif %}
				<p>{{ item.description }}</p>
				<div class="smaller"><a href="{{ item.url }}">{{ item.url }}</a></div>
			</article>
			<hr class="double hairline" />
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

	<hr class="spacer" />
</div>
{% endblock %}
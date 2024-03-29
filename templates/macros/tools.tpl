
{% macro featured(article) %}
	{% set topMug = article.media.grab('meta', 'mugshot', true)[0] %}
	{% set topImage = article.media.grab('type', 'image')[0] %}
	{% set showHeadline = 1 %}
	{% import "macros/disqus.tpl" as disqus %}

	{% if topImage %}
		{% if 'vertical'|in(topImage.meta) %}
			{% set showHeadline = 0 %}
			<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>

			<div class="image">
				<a href="{{ article.url }}">
					<img src="{{ topImage.url }}"  alt="{{ article.headline }}" class="col_2" />
				</a>
				<div class="info small">
					{{ topImage.authors.splat('name')|join(', ') }} /
					{{ topImage.source }}
				</div>

			</div>
		{% else %}
			<div class="image">
				<a href="{{ article.url }}">
					<img src="{{ topImage.url }}"  alt="{{ article.headline }}" class="col_5" />
				</a>
				<div class="info">
					<span class="credit">
						{{ topImage.authors.splat('name')|join(', ') }} /
						{{ topImage.source }}
					</span>
				</div>
			</div>
		{% endif %}
	{% endif %}

	<div class="article">
		{% if showHeadline %}
			<h1><a href="{{ article.url }}">{{ article.headline }}</a></h1>
		{% endif %}

		<div class="small">
			{{ article.created|date('m/d/y') }}
			{% if article.authors.length %}
				By {{ article.authors.splat('name')|join(', ') }}
			{% endif %}
			({{ disqus.countlink(article) }})
		</div>

		{% if topMug %}
			<img src="{{ topMug.url }}" style="float:left;padding:5px 5px 5px 0;" />
		{% endif %}
		<p>{{ article.abstract_formatted }} <a href="{{ article.url }}">Read more &#187;</a></p>

		<br style="clear:both;" />
	</div>
{% endmacro %}

{% macro subFeatured(article) %}
	{% import "macros/disqus.tpl" as disqus %}
	<div class="article">
		<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>

		<div class="small">
			{{ article.created|date('m/d/y') }}
			{% if article.authors.length %}
				By {{ article.authors.splat('name')|join(', ') }}
			{% endif %} ({{ disqus.countlink(article) }})
		</div>

		<p>{{ article.abstract_formatted }} <a href="{{ article.url }}">Read more &#187;</a></p>
	</div>
{% endmacro %}
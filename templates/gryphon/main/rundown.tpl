{% import "macros/article.tpl" as articleRender %}
{% import "macros/render.tpl" as mediaRender %}


{% set sectionsList = [
	['news'],
	['scene'],
	['opinion'],
	['sports']
	] %}

{% for tag in sectionsList %}
	{% fetch articles from article with [
		'order': 'weight desc, created desc',
		'limit': 5,
		'withTags': [tag[0]],
		'where': 'status = 1'
	] %}

	{% fetch cartoons from media with [
		'order': 'weight desc, created desc',
		'limit': 4,
		'withTags': ['cartoon'],
		'where': 'status = 1'
	]%}

	<div class="row-fluid">
	<!--gryphon/main/modules/rundown.tpl-->

		<section class="span12 rundown">
			<header><h2><a href="{{ ('section/'~tag[0])|url }}">{% if tag[0] == "scene" %}<em>the </em>Scene{% else %} {{ tag[0]|capitalize }} {% endif %}</a></h2>
					<h3 class="hidden-phone"><a href="{{ ('section/'~tag[0])|url }}">{% if tag[0] == "scene" %}<em>more from the Scene</em>{% else %}<em>more {{ tag[0]|capitalize }}</em>{% endif %}</a></h3>
			</header>
			<hr class="spacer" />
			<div class="row-fluid">
				<div class="span7">
					{{ articleRender.rundown(articles.shift()) }}
				</div>
				<div class="span5">
					{% for article in articles.shift(4) %}
						{{ articleRender.sidebarRun(article) }}
					{% endfor %}
				</div>
			</div>
		</section>
	</div>


{% endfor %}
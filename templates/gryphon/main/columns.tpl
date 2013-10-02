<a href="{{ 'gryphon:section/columns'|url }}"><header class="box"><h2 class = "column">Columns</h2></header></a>
	<div class="box-content">
		<hr class="half spacer"/>
		{% fetch articles from article with [
			'where': 'status = 1',
			'order': 'weight desc, created desc',
			'limit': 4,
 			'withTags': ['columns']
		] %}

		{% for article in articles %}
			{{ articleRender.column(article) }}
			<hr class="spacer" style="clear:both;"/>
		{% endfor %}
	</div>

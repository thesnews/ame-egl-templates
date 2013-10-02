<!--pre1/featured.tpl-->

<header class="box"><h2>Classifieds</h2></header>
<div class="ad-box">

	<hr class="spacer" />

	<div class="text-center">
	{% include 'gryphon/ads/classifiedsponsor.tpl' %}
	</div>

	<hr class="spacer" />

	{% fetch items from pre1:ad with [
		'where': 'status = 1',
		'order': 'category_id'
	] %}

	{% set category = items[0].category %}
	<a href="{{ category.url }}">{{ category.name }}</a>:
	<ul>
	{% for item in items %}
		{% if item.category_id != category.uid %}
			{% set category = item.category %}
			</ul>
				<p class="classifiedsbackground"><a href="{{ category.url }}">{{ category.name }}</a></p>
			<ul>
		{% endif %}
		<li><a href="{{ item.url }}">{{ item.preview }}</a></li>
	{% endfor %}
	</ul>

	<a id="see-all" href="{{ 'pre1:main'|url }}">see all</a>
</div>


{# gryphon/section/templates/scene.tpl #}
{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}scene{% endblock %}
{% block bodyClass %}section{% endblock %}

{% block content %}
{% fetch centerpiece from article with [
 'order': 'weight desc, created desc',
						'limit': '1',
						'where': 'status = 1',
						'withTags': ['scene', 'photo']
] %}

{#{% set topStory = articles.shift(1) %}#}
{% set secondary = articles.shift(3) %}

{% import "macros/article.tpl" as articleRender %}

<div class="row">
	<div class="span8">

		<div class="row-fluid">
			<div class="span4 vertical-line">
				{# Limits secondary to only two articles allowing for centerpiece getting pulled into secondary also #}
					{% set count = 0 %}
					{% for article in secondary %}
						{% if article.title == centerpiece[0].title %}

						{%else%}
							{%if count > 1 %}
							{% else %}
								{{ articleRender.secondaryNoPhoto(article) }}
								<hr class="double spacer" />
								{% set count = count + 1 %}
							{% endif %}
						{%endif%}

					{% endfor %}
			</div>

			<div class="span8">
					{{ articleRender.topStorySection(centerpiece[0]) }}
					<hr class="double spacer" />

			</div>
		</div>

		<hr class="double spacer" />

		<div class = "row-fluid">
			<div class ="span12 rundown">
				<header><h2><a href="{{'section/arts_entertainment'|url }}"><em>Arts & Entertainment</em></a></h2></header>

				<hr class = "spacer"/>

				<div class = "row-fluid">
					<div class = "span12">
						 {% fetch articles from article with [
							'order': 'weight desc, created desc',
							'limit': 5,
							'withTags': ['arts_entertainment'],
							'where': 'status = 1'
						] %}
						<div class="span6">
							{% set secondary = articles.shift(2) %}
							{% for article in secondary %}
								{{ articleRender.secondary(article) }}
								<hr class="double spacer" />
							{% endfor %}
						</div>
						<div class="span6 second-top">
							{% set topStory = articles.shift(1) %}
							{% for article in topStory %}
								{{ articleRender.topStory(article) }}
								<hr class="double spacer" />
							{% endfor %}
						</div>


					</div>
				</div>
			</div>
		</div>
		<div class = "row-fluid">
			<div class = "span12 rundown">
				<header><h2><a href="{{'section/music'|url }}"><em>Music</em></a></h2></header>

				<hr class = "spacer"/>

				<div class = "row-fluid">
					<div class = "span12">
						{% fetch articles from article with [
						'order': 'weight desc, created desc',
						'limit': 5,
						'withTags': ['music'],
						'where': 'status = 1'
						] %}
						<div class="span6 second-top">
							{% set topStory = articles.shift(1) %}
							{% for article in topStory %}
								{{ articleRender.topStory(article) }}
								<hr class="double spacer" />
							{% endfor %}
						</div>

						<div class="span6">
							{% set secondary = articles.shift(2) %}
							{% for article in secondary %}
								{{ articleRender.secondary(article) }}
								<hr class="double spacer" />
							{% endfor %}
						</div>



					</div>
				</div>
			</div>
		</div>

		<div class="row-fluid">
			<div class="span12 rundown">
				<header><h2><em style="color:#fff;">More from the Scene</em></h2></header>

				<hr class="spacer" />

				<div class="row-fluid">
					<div class="span6 second-top">
						{% set topStory = articles.shift(1) %}
						{% for article in topStory %}
							{{ articleRender.topStory(article) }}
							<hr class="double spacer" />
						{% endfor %}
					</div>

					<div class="span6">
						{% set secondary = articles.shift(2) %}
						{% for article in secondary %}
							{{ articleRender.rundown(article) }}
							<hr class="double spacer" />
						{% endfor %}
					</div>
				</div>
			</div>
		</div>

		<hr class="double spacer" />

		<div class="row-fluid">
			<div class="span12">

				{% include 'gryphon/multimedia/slider.tpl' with ['tags': ['scene','carousel']] %}

			</div>
		</div>

		<div class="row-fluid section-spacer">
			<div class="span7 section-rundown">
				{% set rundown = articles.shift(1) %}
				{% for article in rundown %}
					{{ articleRender.rundown(article) }}

				{% endfor %}
			</div>
			<div class="span5">
				{% set sidebar = articles.shift(4) %}
				{% for article in sidebar %}
					{{ articleRender.sidebarRun(article) }}

				{% endfor %}
			</div>
		</div>

		<div class="row-fluid">
			<div class="span7 section-rundown">
				{% set rundown = articles.shift(1) %}
				{% for article in rundown %}
					{{ articleRender.rundown(article) }}

				{% endfor %}
			</div>
			<div class="span5">
				{% set sidebar = articles.shift(4) %}
				{% for article in sidebar %}
					{{ articleRender.sidebarRun(article) }}

				{% endfor %}
			</div>
		</div>

		<hr class="double spacer" />
	</div> <!--end span8-->
		{% include "gryphon/main/sidebar-standard.tpl" %}
</div> <!--end row-->
{% include "gryphon/main/eaglestories.tpl" %}

<hr class="spacer" />

{% endblock content %}
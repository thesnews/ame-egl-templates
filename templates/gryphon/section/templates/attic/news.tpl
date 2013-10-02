<!-- gryphon/section/templates/attic/news.tpl -->

{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}News{% endblock %}	{% block content %}


{% set topStory = articles.shift() %}
<!--{% set featuredStories = articles.shift(2) %}-->
{% set secondary = articles.shift(4) %}
{% set tertiary = articles.shift(4) %}

{% import "macros/article.tpl" as articleRender %}

<div class="row">
	<div class="span8">

		{% if topStory.media.length and topStory.media.length > topStory.media.grab('meta', 'mugshot').length %}
			{{ articleRender.topStory(topStory) }}
		{% else %}
			<div class="row-fluid">
				<div class="span7">
					{{ articleRender.topStoryNoPhoto(topStory) }}
				</div>
				<div class="span5">
					{% set topStory = secondary.shift() %}
					{{ articleRender.standard(topStory) }}
				</div>
			</div>
		{% endif %}

		<hr class="double hairline" />
		<div class="row-fluid">
			<div class="span5">
				<div class="side-box">
					<header class="box"><h3>Recent News</h3></header>
						<div class="box">
							{% for article in tertiary %}
								{{ articleRender.short(article) }}
								<hr class="double hairline" />
							{% endfor %}
						</div>
				</div>
			</div>
			<div class="span7">
			{% for article in secondary %}
					{{ articleRender.standard(article) }}
					<hr class="double spacer" />
				{% endfor %}
			</div>
		</div>
		<hr class="double hairline" />
		<div class="row-fluid">
                   {% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['sports']
					] %}
					<div class="rundown-box span4">
						<header class="box"><h3>Sports</h3></header>
						<div class="box">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<img src="{{ topMedia.urlPreview }}" class="inline" style="max-width:75px;" />
										<div class="has-media">
									{% endif %}
									<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
									<hr class="half spacer" />
									<aside>
										<div class="pull-right">
											Published {{ article.created|timeSince }}
										</div>
									</aside>
									{% if topMedia %}
										</div>
									{% endif %}
								</article>
								<hr class="hairline" />
							{% endfor %}
						</div>
					</div>

					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['features']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/features'|url }}"><h3>Features</h3></a></header>
						<div class="box">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<img src="{{ topMedia.urlPreview }}" class="inline" style="max-width:75px;" />
										<div class="has-media">
									{% endif %}
									<span class="kicker">{{ article.sections[0].name }} </span><br /><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
									<hr class="half spacer" />
									<aside>
										<div class="pull-right">
											Published {{ article.created|timeSince }}
										</div>
									</aside>
									{% if topMedia %}
										</div>
									{% endif %}
								</article>
								<hr class="hairline" />
							{% endfor %}
						</div>
					</div>



					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['opinion']
					] %}
					<div class="rundown-box span4">
						<header class="box"><h3>Opinion</h3></header>
						<div class="box">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<img src="{{ topMedia.urlPreview }}" class="inline" style="max-width:75px;" />
										<div class="has-media">
									{% endif %}
									<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
									<hr class="half spacer" />
									<aside>
										<div class="pull-right">
											Published {{ article.created|timeSince }}
										</div>
									</aside>
									{% if topMedia %}
										</div>
									{% endif %}
								</article>
								<hr class="hairline" />
							{% endfor %}
						</div>
					</div>
			</div>
		</div>
		{% include "gryphon/main/sidebar-standard.tpl" %}
</div>


<hr class="spacer" />

{% endblock content %}

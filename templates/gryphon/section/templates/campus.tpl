{# gryphon/section/templates/campus.tpl #}
{% extends "gryphon/base.tpl" %}

{% block title %}Campus{% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}Campus{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
<!--{% set featuredStories = articles.shift(2) %}-->
{% set secondary = articles.shift(4) %}
{% set tertiary = articles.shift(4) %}
{% import "macros/article.tpl" as articleRender %}
<div class="row">
	<div class="span8">
		{{ articleRender.topStory(topStory) }}

		<hr class="double hairline" />

	
		<div class="row-fluid">
			<div class="span7">
				{% for article in secondary %}
					{{ articleRender.standard(article) }}
					<hr class="double spacer" />
				{% endfor %} 
	
			</div>
			<div class="span5">
		<!--		<header class="box"><h3>Recent News</h3></header>
				<div class="box">
					{% for article in tertiary %}
						{{ articleRender.short(article) }}
						<hr class="double hairline" />
					{% endfor %}
				</div> -->
				<h5 class="bordered">
					MORE CAMPUS:
				</h5>

				<ul>
					{% for article in tertiary %}
						<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> </li>
					{% endfor %}
	 			</ul>
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
						<header class="box"><a href="{{ 'section/sports'|url }}"><h3>Sports</h3></a></header>
						<div class="box">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<a href="{{ article.url }}"><img src="{{ topMedia.urlPreview }}" class="inline" style="max-width:75px;" /></a>
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
										<a href="{{ article.url }}"><img src="{{ topMedia.urlPreview }}" class="inline" style="max-width:75px;" /></a>
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
						'withTags': ['opinion']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/opinion'|url }}"><h3>Opinion</h3></a></header>
						<div class="box">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<a href="{{ article.url }}"><img src="{{ topMedia.urlPreview }}" class="inline" style="max-width:75px;" /></a>
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
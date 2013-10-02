{# gryphon/main/main.tpl #}
{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{#{% block active %}News{{ activeNav }}{% endblock %}#}
{% block subActive %}{% endblock %}
{% block description %}{{ article.abstract_formatted|striptags }}{% endblock %}
{% block content %}


{% set topStory = articles.shift() %}
{% set secondary = articles.shift(4) %}
{% set tertiary = articles.shift(4) %}

{% import "macros/article.tpl" as articleRender %}

<div class="row">
	<div class="span8">

		<h1>
			{{ section.name }}
			{% if activeNav == 'news' %}
				<div class="subnav pull-right">
					<ul>
						<li><strong>More</strong></li>
						<li><a href="{{ 'section/campus'|url }}">Campus</a></li>
						<li><a href="{{ 'section/city'|url }}">City</a></li>
						<li><a href="{{ 'section/police_briefs'|url }}">Police Briefs</a></li>
					</ul>
				</div>
			{% elseif activeNav == 'opinion' %}
				<div class="subnav pull-right">
					<ul>
						<li><strong>More</strong></li>
						<li><a href="{{ 'section/editorials'|url }}">Editorials</a></li>
						<li><a href="{{ 'section/columns'|url }}">Columns</a></li>
						<li><a href="{{ 'section/letters'|url }}">Letters</a></li>
					</ul>
				</div>
		  {% elseif activeNav == 'features' %}
		    <div class="subnav pull-right">
					<ul>
						<li><strong>More</strong></li>
						<li><a href="{{ 'page/entertainmentpodcast'|url }}">Podcast</a></li>
					</ul>
				</div>
			{% endif %}
		</h1>
		<hr class="hairline" />

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

		{% include 'gryphon/ads/mobile.tpl' %}

		<hr class="double hairline" />
		<div class="row-fluid">
			<div class="span5">
				<div class="side-box">
					<header class="box"><h3>More {{ section.name }}</h3></header>
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
									<span class="kicker">{{ article.sections[0].name }} </span><br/><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
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
<hr class="double spacer" />
<div class= "row">
	<div class="span12">
		{% include 'gryphon/main/eaglestories.tpl' %}
	</div>
</div>


<hr class="spacer" />

{% endblock content %}

{# gryphon/section/templates/police.tpl #}
{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}Police Briefs{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}

<div class="row">
	<div class="span8">
		<h5 class="bordered">
			POLICE BRIEFS:
		</h5>
		{% for article in featuredStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}
	</div>
	<div class="span8">
		{{ articleRender.abstract5Col(topStory) }}		
		{{ articleRender.abstract5Col(topStory) }}	
		
		<hr class="spacer" />
	
<div class="row">	
	<div class="span8">
		<h5 class="bordered">
			MORE POLICE BRIEFS:
		</h5>
		
<ul>
				{% for article in articles %}
					<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> </li>
				{% endfor %}
			</ul>
		<div class="span6">
			<ul>
			{% for item in items.shift((items.length)/2) %}
				<li>
					<h4><a href="{{ item.url }}">{{ item.title }}</a></h4><br />
					<span class="small">{{ item.byline }}</span>
					
					<p>{{ item.abstract }}</p>
				</li>
			{% endfor %}
			</ul>
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
						<header class="box"><h3>Features</h3></header>
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
						<header class="box"><h3>Opinion</h3></header>
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
		</div></div></div>


	
{% include 'gryphon/main/sidebar-standard.tpl' %}



<hr class="spacer" />

{% endblock content %}
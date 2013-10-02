<!-- gryphon/section/templates/attic/features.tpl -->

{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}features{% endblock %}
{% block subActive %}Features{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondary = articles.shift(4) %}
{% set recent = articles.shift(4) %}
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
							{% for article in recent %}
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
						'withTags': ['news']
					] %}
					<div class="rundown-box span4">
						<header class="box"><h3>News</h3></header>
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




					{% fetch blogs from blog with [
						'order': 'modified desc',
						'where': 'status = 1',
						'limit': 3
					] %}
					<div class="rundown-box span4">
						<header class="box"><h3>Blogs</h3></header>
						<div class="box">
							{% for blog in blogs %}
								{% set post = blog.mostRecent %}
								<article class="clearfix">
									<h4><span class="kicker">{{ blog.name }}</span><br /><a href="{{ post.url }}">{{ post.headline }}</a></h4>
									<hr class="half spacer" />
									<aside>
										<div class="pull-right">
											Published {{ post.created|timeSince }}
										</div>
									</aside>
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
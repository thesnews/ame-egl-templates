{# gryphon/section/templates/frontpage-dom-gallery.tpl #}
{% extends "gryphon/base.tpl" %}

{% block active %}{{ section.slug }}{% endblock %}

{% block content %}
{% import "macros/article.tpl" as articleRender %}
{% helper disqusPopular as popular %}


{% set topStory = articles.shift() %}
{% set secondary = articles.shift(4) %}
{% set tertiary = articles.shift(4) %}


<div class="row">
	<div class="span8">

		{% if breaking %}
			<header class="breaking">
				<h4>Breaking News</h4>

   				    Updated {{ breaking.modified|timeSince }}

			</header>
			<hr class="half spacer" />

			<div class="breaking-box">
				<h3>
					<a href="{{ breaking.url }}">{{ breaking.headline }}</a>
				</h3>
			</div>
			<hr class="double spacer" />
		{% endif %}
		{% if developing %}
			<header class="developing">
				<h4>Developing Story</h4>

   				    Updated {{ developing.modified|timeSince }}

			</header>
			<hr class="half spacer" />

			<div class="breaking-box">
				<h3>
					<a href="{{ developing.url }}">{{ developing.headline }}</a>
				</h3>
			</div>
			<hr class="double spacer" />
		{% endif %}

		{% set mugs = topStory.media.grab('meta', 'mugshot', true) %}
		{% set images= topStory.media.grab('type', 'image') %}
		{% set galleries= topStory.media.grab('meta', 'gallery', true) %}
		
<div class="frontpage-major-event">

	<article class="row-fluid">
		<div class="span12">
	
        	               
               <div id="top-gallery" class="carousel">
{% fetch galleries from gryphon:media with [ 
				'limit': 10,
				'where': 'status = 1',
				'order': 'weight desc, created desc',
				'withTags': ['top_gallery']
			] %}


                    <div class="carousel-inner">
                        {% for image in images %}
                            <div class="item{% if loop.index0 == 0 %} active{% endif %}">
                                <div style="width:100%;background:url({{ image.gallery.urlOriginal}}) no-repeat center center;">
                                    <div class="caption">
                                        <h1><a href="{{ topStory.url }}">{{ image.title }}</a></h1>
                                        {{ image.caption_formatted }}
                                    </div>
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                    <a class="carousel-control left" href="#top-gallery" data-slide="prev">&lsaquo;</a>
                    <a class="carousel-control right" href="#top-gallery" data-slide="next">&rsaquo;</a>
                </div>

				<hr class="spacer" />
				<h1><a href="{{ topStory.url }}">{{ topStory.headline }}</a></h1>
			</div>

            <div class="row-fluid">
                <div class="span12">

                    <hr class="half spacer" />

                    <p>
                    {% if mugs.length %}
                        <a href="{{ topStory.url }}"><img src="{{ mugs[0].url }}" class="inline" /></a>
                    {% endif %}
                    {{ topStory.abstract|clip(250) }}
                    </p>

                    <aside>
                    {% if topStory.authors.length %}
                        By {{ topStory.authors.splat('name')|join(', ') }}
                    {% else %}
                        &nbsp;
                    {% endif %}
                    <div class="pull-right">
                        Published {{ topStory.created|timeSince }}

                </div>
                </aside>

                <hr class="half spacer clearfix" />

                <a href="{{ topStory.url }}" class="btn btn-primary">Read More</a>

                </div>
            </div>
        </article>

		</div>

		<hr class="double spacer" />

		{% include 'gryphon/ads/mobile.tpl' %}



			<h1 class="spotlight">SPOTLIGHT</h1>

				<hr class="spacer" />

			<div class="row-fluid">
				<div class="span6">
					{{ articleRender.standard(secondary[0]) }}
				</div>
				<div class="span6">
					{{ articleRender.standard(secondary[1]) }}
				</div>
			</div>
			<div class="row-fluid">
				<div class="span6">
					{{ articleRender.standard(secondary[2]) }}
				</div>
				<div class="span6">
					{{ articleRender.standard(secondary[3]) }}
				</div>
			</div>


		<hr class="double spacer" />

		<div class="row-fluid">
			<div class="span12">

				{% include 'gryphon/multimedia/box-new.tpl' %}

			</div>
		</div>

		<hr class="double hairline" />

		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['news']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/news'|url }}"><h3>News</h3></a></header>
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
		</div>

		<hr class="double spacer" />

		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
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

					{% fetch blogs from blog with [
						'order': 'modified desc',
						'where': 'status = 1',
						'limit': 3
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'blog'|url }}"><h3>Blogs</h3></a></header>
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

					<div class="rundown-box span4">
						<header class="box"><h3>Most Popular</h3></header>
						<div class="box">
							{% for item in popular.threads|shift(5) %}
								<article class="clearfix">
									<h4><a href="{{ item.link }}">{{ item.title }}</a></h4>
								</article>
								<hr class="hairline" />
							{% endfor %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<hr class="double spacer" />

{% endblock content %}

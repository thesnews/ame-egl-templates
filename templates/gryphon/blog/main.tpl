{# gryphon/blog/main.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ blog.headline }}{% endblock %}
{% block active %}blog{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}

{% block content %}

{% set mugShots = post.media.grab('meta', 'mugshot', true) %}
{% set galleries = post.media.grab('meta', 'gallery', true) %}

{% set images = post.media.grab('type', 'image', true) %}
{% set videos = post.media.grab('type', 'video', true) %}
{% set sounds = post.media.grab('type', 'audio', true) %}
{% set slides = post.media.grab('type', 'soundSlide', true) %}

<div class="row">
	<div class="span8">
		{% if blog.media.length %}
			<a href="{{ blog.url }}" style="border:0;"><img src="{{ blog.media[0].url }}" alt="{{ blog.name }}" title="{{ blog.name }}" style="border:0;"/></a>
			<hr class="spacer" />
		{% endif %}

		<h1>{{ post.headline }}</h1>

		<hr class="spacer" />

		<div class="highlight smaller">
			By {{ post.authors.splat('name')|join(', ') }}
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Posted: {{ post.created|timeSince }}
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			{{ disqus.countlink(post) }}
		</div>

		<hr class="spacer" />

		<article>
			{% if mugShots.length %}
				{% for mug in mugShots %}
				<div class="mugshots">
					<img src="{{ mug.url }}" alt="{{ mug.caption }}" />
					<strong>{{ mug.caption_formatted }}</strong>
				</div>
				{% endfor %}
			{% endif %}

			{{ post.copy_formatted|extract(5) }}

      <!--
<div class="integrated-media-left">
			{% for image in images %}
				<div class="image">
					<a href="{{ image.urlDefault }}" class="fancybox-single"><img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" /></a>
					<figcaption >
					<i class="icon-camera"></i>
					 Photo: {{ image.caption|clip(15) }}
				  </figcaption>
				</div>
			{% endfor %}
			</div>
-->

      {% if images.length or gallery.length or video.length or sound.length or pdfs.length or flash.length %}
				<div class="integrated-media-left">

					{% for image in images %}

						<div class="image">
							<a href="{{ image.url }}" class="fancybox-single" rel="article_{{ article.uid }}"><img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" /></a>
							<figcaption><i class="icon-camera"></i> {{ image.caption|clip() }}</figcaption>
						</div>
					{% endfor %}
					</div>
		  {% endif %}


			{% for gallery in galleries %}
				<div class="gallery sidebar-item expandable">
					<a href="{{ gallery.galleries[0].urlDefault }}"><img src="{{ gallery.urlPreview }}" alt="{{ gallery.base_name }}" class="preview" /></a>
					<span>Gallery: {{ gallery.galleries[0].title|clip(15) }}</span>
				</div>
			{% endfor %}

			{% for video in videos %}
				<div class="video sidebar-item expandable">
					<a href="{{ video.urlDefault }}"><img src="{{ video.urlPreview }}" alt="{{ video.base_name }}" class="preview" /></a>
					<span>Video: {{ video.title|clip(15) }}</span>
				</div>
			{% endfor %}

			{% for slide in slides %}
				<div class="slide sidebar-item expandable">
					<a href="{{ slide.urlDefault }}"><img src="{{ slide.urlPreview }}" alt="{{ slide.base_name }}" class="preview" /></a>
					<span>Slideshow: {{ slide.title|clip(15) }}</span>
				</div>
			{% endfor %}

			{% for sound in sounds %}
				<div class="sound sidebar-item">
					<h5>Audio: {{ sound.title }}</h5>
					{{ render.media(sound, 'audio_article') }}
				</div>
			{% endfor %}
			{{ post.copy_formatted|extract(null, 5) }}
		</article>

		<hr class="clearfix double hairline" />

		{{ disqus.list(post) }}

	</div>

	{% include 'gryphon/main/sidebar-standard.tpl' %}

	<hr class="spacer" />
</div>


{% endblock %}
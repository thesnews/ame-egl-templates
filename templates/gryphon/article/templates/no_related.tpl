{# gryphon/article/main.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ article.headline }}{% endblock %}
{% block description %}{{ article.abstract_formatted|striptags }}{% endblock %}
{% block active %}news{% endblock %}
{% block bodyClass %}article{% endblock %}
{% block links %}
	<link rev="canonical" type="text/html" href="{{ article.url }}" />
	<link rel="alternate shorter" type="text/html" href="{{ shortUrl }}" />
{% endblock %}


{% block content %}
{% helper commentHelper %}

{% import "macros/render.tpl" as render %}

{# we grab these ahead because they are all 'images' #}

{% set infoGraphs = article.media.grab('meta', 'info graphic', true) %}
{% set mugShots = article.media.grab('meta', 'mugshot', true) %}
{% set galleries = article.media.grab('meta', 'gallery', true) %}
{% set interactives = article.media.grab('meta', 'interactive', true) %}

{% set pdfs = article.media.grab('type', 'pdf', true) %}

{% set images = article.media.grab('type', 'image', true) %}
{% set videos = article.media.grab('type', 'video', true) %}
{% set sounds = article.media.grab('type', 'audio', true) %}
{% set slides = article.media.grab('type', 'soundSlide', true) %}
{% set flash = article.media.grab('type', 'flash', true) %}

{% set sections = article.sections %}

<!-- SHAREBOX -->
	{#<div id='sharebox'>
		<!-- Twitter -->
		<script src="http://platform.twitter.com/widgets.js" type="text/javascript"></script>
		<div class="social">
  			<a href="{{ article.urlShort }}" class="twitter-share-button"
    			data-url="{{ article.urlShort }}"
    			data-count="vertical">Tweet</a>
		</div>

		<!-- FB -->
		<div class="social">
		    <div class="fb-like" data-href="{{ article.urlShort }}" data-send="false" data-layout="box_count" data-width="60"
			data-show-faces="true" data-font="verdana"></div>
		</div>

		<!-- FB JavaScript SDK -->
		<div id="fb-root"></div>
			<script>(function(d, s, id) {
  			var js, fjs = d.getElementsByTagName(s)[0];
 			if (d.getElementById(id)) return;
  			js = d.createElement(s); js.id = id;
  			js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
 			fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
			</script>

		<!-- Google Plus -->
		<div class="social">
			<!-- Place this tag where you want the +1 button to render. -->
			<div class="g-plusone" data-size="tall"></div>

		<!-- Place this tag after the last +1 button tag. -->
			<script type="text/javascript">
  			(function() {
    			var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
   			 po.src = 'https://apis.google.com/js/plusone.js';
    			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  				})();
			</script>
		</div>

			<!-- Pinterest -->
			<div class="social">
				<a href="http://pinterest.com/pin/create/button/?url={{ article.urlShort }}" class="pin-it-button" count-layout="vertical"><img src="//
				assets.pinterest.com/images/PinExt.png" title="Pin It" /></a>
			</div>

			<!-- Comment -->
			<div class="comment">
				<div class="comment-count"><p>{{ item.posts|int2noun('comment') }}</p></div>
					<a href="#comments"><img src="{{ 'assets/dist/img/comment.png'|asset }}" alt="commentbox" /></a>
				</div>
			</div>#}
<!-- MAIN CONTENT -->
<br />
<div class="row">
	<div class="span8">

		<article>

			{% if commentHelper.userHasSession() %}
				<a href="{{ article.getEditURL() }}" class="btn btn-danger" target="_gedit">EDIT THIS</a>
				<hr class="spacer" />

			{% endif %}
			<h1>{{ article.headline }}</h1>

			<hr class="spacer" />

			{% if article.subhead %}
				<h2>{{ article.subhead }}</h2>
				<hr class="spacer" />
			{% endif %}

			<!-- AUTHOR BI-LINE -->

			<aside>
				{% if article.authors.length %}
					{% set author = article.authors.shift() %}
						By <a href="{{ author.url }}">{{ author.name }}</a>
						{% for author in article.authors %}
							and <a href="{{ author.url }}">{{ author.name }}</a>
						{% endfor %}
				{% endif %}
				| Published {{ article.created|timeSince }}


				{% if article.created != article.modified %}
   					| Updated {{ article.modified|timeSince }}
				{% endif %}

			</aside>

			<hr class="spacer" />

			{% include 'gryphon/ads/mobile.tpl' %}
			
			<hr class="spacer" />

			<!-- FEATURE PHOTO -->

			<div>

				{% if videos.length %}
					{% set domVid = videos.shift() %}

					{{ render.media(domVid, 'article') }}
					{#<figcaption>
						{% set author= domVid.authors.shift() %}
								By <a href="{{ author.url}}">{{ author.name }}</a>
								{% for author in domVid.authors %}
									and <a href="{{ author.url }}">{{ author.name}}</a>
								{% endfor %}
						{% if domVid.source %}
							/ {{ domVid.source }}
						{{ domVid.caption_formatted }}


						{% endif %}

					</figcaption>#}

				{% elseif images.length %}
					{% set domPhoto = images.shift() %}
					<figure>
						<a href="{{ domPhoto.url }}" class="fancybox-single" rel="article_{{ article.uid }}"><img src="{{ domPhoto.urlOriginal }}" alt="{{ domPhoto.base_name }}"/></a>


						{#<figcaption>

						{% if domPhoto.authors.length %}
								{% set author= domPhoto.authors.shift() %}
									By <a href="{{ author.url}}">{{ author.name }}</a>
									{% for author in domPhoto.authors %}
										and <a href="{{ author.url }}">{{ author.name}}</a>
									{% endfor %}
								{% if domPhoto.source %}
								/ {{ domPhoto.source }}
							{% endif %}
						{% else %}
						&nbsp;
						{% endif %}

						{{ domPhoto.caption_formatted }}

						</figcaption>#}
					</figure>

				{% endif %}


			</div>

			<hr class="double spacer" />

			{#{% if mugShots.length %}
				{% for mug in mugShots %}
					<div class="pull-left">
						<div class="mugshots">
							<img src="{{ mug.urlThumbnail }}" alt="{{ mug.caption }}"/>
							{{ mug.caption_formatted }}
						</div>
					</div>
				{% endfor %}
			{% endif %}#}

			{{ article.copy_formatted|extract(2) }}

			{% if images.length or gallery.length or video.length or sound.length or pdfs.length or flash.length or domPhoto.gallery or article.infobox %}
				<div class="integrated-media-left hidden-phone">

				{% if article.infobox.length or pdfs.length %}
					<div class="info-box">
						<div class="highlight">
							{% if article.infobox %}
								{{ article.infobox_formatted }}
							{% endif %}
							{% if pdfs.length %}
								{% if article.infobox %}
									<hr class="spacer" />
								{% endif %}

								{% if pdfs.length %}
									<h5>Related Documents:</h5>
									<ul>
										{% for pdf in pdfs %}
											<li><a href="{{ pdf.urlOriginal }}"><i class="icon-book"></i> {{ pdf.title }}</a> - PDF</li>
										{% endfor %}
									</ul>
								{% endif %}
							{% endif %}
						</div>
					</div>
				{% endif %}


					{% if domPhoto and domPhoto.gallery %}
						<div class="gallery">
							<img src="{{ domPhoto.urlPreview }}" alt="{{ domPhoto.base_name }}" class="preview" />
							<a href="{{ domPhoto.gallery.urlDefault }}" class="gall_link">View Full Gallery</a>
							<figcaption><i class="icon-th"></i> {{ domPhoto.gallery.title }}</figcaption>
						</div>
					{% endif %}

					{% for image in images %}
						{% if image.gallery %}
							<div class="gallery">
								<img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" class="preview" />
								<a href="{{ image.gallery.urlDefault }}" class="gall_link">View Full Gallery</a>
								<figcaption><i class="icon-th"></i> {{ image.gallery.title }}</figcaption>
							</div>
						{% else %}
							<div class="image">
								<a href="{{ image.url }}" class="fancybox-single" rel="article_{{ article.uid }}"><img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" /></a>
								<figcaption>

									<span>
									{% if image.authors.length %}
										{% set author= image.authors.shift() %}
											By <a href="{{ author.url}}">{{ author.name }}</a>
											{% for author in image.authors %}
												and <a href="{{ author.url }}">{{ author.name}}</a>
											{% endfor %}
										{% if image.source %}
										/ {{ image.source }}
										{% endif %}
									{% else %}
									&nbsp;
									{% endif %}
									</span>
									<br />

									<i class="icon-camera"></i>{{ image.caption }}
								</figcaption>
							</div>
						{% endif %}
					{% endfor %}

					{% for gallery in galleries %}

						<div class="gallery">
							<img src="{{ gallery.urlPreview }}" alt="{{ gallery.base_name }}" class="preview" />
							<a href="{{ gallery.gallery.urlDefault }}" class="gall_link">View Full Gallery</a>
							<figcaption><i class="icon-th"></i> {{ gallery.gallery.title }}</figcaption>
						</div>

					{% endfor %}

					{% for infoGraph in infoGraphs %}
						<div class="infograph">
							<img src="{{ infoGraph.url }}">
						</div>
					{% endfor %}



					{% for video in videos %}

						<div class="video">
							<a href="{{ ('media/'~video.uid)|url }}" class="fancybox.ajax"><img src="{{ video.urlPreview }}" alt="{{ video.base_name }}" class="preview" /></a>
								<p>Video: {{ video.title|clip() }}</p>
						</div>

					{% endfor %}

					{% for item in flash %}

						{% if item.meta['flashembed'] %}
							<div class="flash">
								<a href="{{ item.urlDefault }}"><img src="{{ item.urlPreview }}" alt="{{ item.base_name }}" class="preview" /></a>
									<p>Interactive: {{ item.title|clip() }}</p>
							</div>

						{% endif %}

					{% endfor %}

					{% for sound in sounds %}

						<div class="audio">
							<div class="box">
							<i class="icon-volume-up"></i> {{ sound.title }}
							<audio src="{{ sound.urlOriginal }}" preload="auto" />
							</div>
						</div>

					{% endfor %}
				</div>
			{% endif %}


			{{ article.copy_formatted|extract(null, 2) }}

			{#<div class="pull-quote">
				<p>"This is an example pull-quote," Matt Said.</p>
			</div>#}

			{#<ul class="share unstyled">
				<li><a class="socialite twitter-share" href="http://twitter.com/share" data-url="{{ article.url }}">Share on Twitter</a></li>
				<li><a class="socialite googleplus-one" href="https://plusone.google.com" data-href="{{ article.url }}" data-size="medium">+1</a></li>
				<li><a class="socialite facebook-like" data-send="false" data-layout="button_count" data-width="60" data-show-faces="false">Like on Facebook</a></li>#}
			</ul>
			
			
			<ul class="share unstyled">
				<li><a href="http://www.facebook.com/theaueagle"><img src="{{ 'assets/dist/img/facebook_logo.png'|asset }}" alt="Facebook Logo"></a></li>
				<li><a href="http://twitter.com/theeagleonline"><img src="{{ 'assets/dist/img/twitter-logo.png'|asset  }}" alt="Twitter Logo"></a></li>
				<li><a href="mailto:?subject=American%20Eagle:%20"><img src="{{ 'assets/dist/img/email_icon.png'|asset  }}" alt="Email Icon"></a></li>
			</ul>


			<hr class="hairline clearfix" />

			{#<div class="row-fluid clearfix">
				<div class="span12">
					<div id="comments">
						{{ disqus.list(article) }}
					</div>
				</div>
			</div>#}

			<div class="fb-comments" data-href="{{ article.url }}"></div>

			<hr class="double spacer" />

			{#<div class="related-stories">
				<div class="row-fluid">
					<div class="span12">
						<h1>RELATED STORIES</h1>
					</div>
				</div>
				<div class="row-fluid">
					{% set related = article.getRelated() %}
					<div class="span6">
						{% for item in related.shift(2) %}
							<div class="related clearfix">
								{% if item.media.length %}
									{% set img = item.media.grab('type', 'image')[0] %}
									<a href="{{ item.url }}"><img src="{{ img.urlThumbnail }}" /></a>
								{% endif %}
								<h5><a href="{{ item.url }}">{{ item.headline }}</a></h5>
								<aside>
									{% if item.authors.length %}
										{% set author = item.authors.shift() %}
											By <a href="{{ author.url }}">{{ author.name }}</a>
											{% for author in item.authors %}
												and <a href="{{ author.url }}">{{ author.name }}</a>
											{% endfor %}
									{% endif %}
									| Published {{ item.created|timeSince }}
								</aside>

							</div>
						{% endfor %}
					</div>
					<div class="span6">
						{% for item in related %}
							<div class="related clearfix">
								{% if item.media.length %}
									{% set img = item.media.grab('type', 'image')[0] %}
									<a href="{{ item.url }}"><img src="{{ img.urlThumbnail }}" /></a>
								{% endif %}
								<h5><a href="{{ item.url }}">{{ item.headline }}</a></h5>
								<aside>
									{% if item.authors.length %}
										{% set author = item.authors.shift() %}
											By <a href="{{ author.url }}">{{ author.name }}</a>
											{% for author in item.authors %}
												and <a href="{{ author.url }}">{{ author.name }}</a>
											{% endfor %}
									{% endif %}
									| Published {{ item.created|timeSince }}
								</aside>

							</div>
						{% endfor %}
					</div>
				</div>
			</div>#}
		</article>
	</div>
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>
{% endblock %}

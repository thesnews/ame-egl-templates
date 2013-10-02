{#gryphon/gallery/main.tpl#}

{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block activeNav %}multimedia{% endblock %}

{% block bodyClass %}multimedia{% endblock %}

{% block scripts %}
	<script src="{{'assets/dist/galleria/galleria-1.2.9.min.js'|asset}}"></script>
	<script>
		(function($) {
			$(function() {
			    Galleria.loadTheme('{{"assets/dist/galleria/classic/galleria.classic.min.js"|asset}}');
			    Galleria.run('#galleria', {showInfo: true,_toggleInfo: false});
			});
		})(jQuery);
	</script>
{% endblock %}

{% block content %}
{% helper request %}

{% import "macros/render.tpl" as mediaRender %}

{% set topMedia = false %}

{% if request.getSegment(1) %}
	{% set topMedia = media.shift() %}
{% endif %}

<div class="row">
<div class="multimedia">
	<div class="span8 gallery">
		<h1 class="clearfix">

			{{ gallery.title }}

		</h1>
		<hr class="hairline clearfix" />

		<p class="copy">{{ gallery.description_formatted|default('Select a photo below to open the gallery') }}</p>

		<hr class="double spacer" />

		<div id="galleria">
			<a href="{{image.url}}"><img src="{{image.urlPreview}}" data-title="{{image.title}}" data-description="{{image.caption_formatted}}" /></a>
			{% for i in gallery.mediaOrdered %}
				{% if i.uid != image.uid %}
					<a href="{{i.url}}"><img src="{{i.urlPreview}}" data-title="{{i.title}}" data-description="{{i.caption_formatted}}" /></a>
				{% endif %}
			{% endfor %}
		</div>


		<ul class="share">
			<li><a href="http://www.facebook.com/theaueagle"><img src="{{ 'assets/dist/img/facebook_logo.png'|asset }}" alt="Facebook Logo"/></a></li>
			<li><a href="http://twitter.com/theeagleonline"><img src="{{ 'assets/dist/img/twitter-logo.png'|asset }}" alt="Twitter Logo"/></a></li>
			<li><a href="http://twitter.com/theeagleonline"><img src="{{ 'assets/dist/img/email_icon.png'|asset }}" alt="Email Icon"/></a></li>
		</ul>


		<hr class="double spacer clearfix " />
		<hr clss = "hairline"/>
		<div class="fb-comments" data-href="{{ gallery.urlDefault }}"></div>

		<hr class="double spacer" />

{% if gallery.tags.length %}
<div class=row-fluid span12>
  <h3 class="clearfix">Related Galleries<span class="pull-right">
  <a href="{{ 'gallery'|url }}" style="font-size:12px;">More galleries <i class="icon-chevron-right icon-white"></i></a></span></h3>
    <div class=row-fluid>
	   	<div class=span6>
	 	   	{% fetch gals from gallery with [
	 		  	'where': 'status = 1',
				  'order': 'created desc',
				  'withTags': gallery.tags.splat('name'),
		  		'limit': 4
		  	] %}
		  	<hr class="spacer" />
		  	<ul class="unstyled">
			   	{% for gal in gals.shift(2) %}
				  	<li>
					   	<div class="photo-wrap" style="height:125px;">
                <a href="{{ gal.urlDefault }}">
							   	<img src="{{ gal.urlPreview }}" style="max-height:125px;" />
				        </a>
						  </div>
						  <hr class="half spacer" />
						  <h4><a href="{{ gal.urlDefault }}">{{ gal.title }}</a></h4>
						  <aside class="credit">
						    <span class="pull-left">{{ gal.created|timeSince }}</span>
						  </aside>
						  <hr class="double spacer clearfix" />
					 </li>
				  {% endfor %}
			  </ul>
      </div>
      <div class=span6>
		    <hr class="spacer" />
		    <ul class="unstyled">
		     {% for gal in gals %}
		        <li>
		  		    <div class="photo-wrap" style="height:125px;">
						    <a href="{{ gal.urlDefault }}">
  						  <img src="{{ gal.urlPreview }}" style="max-height:125px;" />
				        </a>
					</div>
						<hr class="half spacer" />
						<h4><a href="{{ gal.urlDefault }}">{{ gal.title }}</a></h4>
						  <aside class="credit">
						    <span class="pull-left">{{ gal.created|timeSince }}</span>
						  </aside>
				    <hr class="double spacer clearfix" />
		        </li>
		      {% endfor %}
		    </ul>
		</div>
  </div>
</div>
{% endif %}


		<hr class="double hairline" />

		{% include 'gryphon/multimedia/more.tpl' %}

	</div> <!-- closes span8 -->
</div>
	{% include 'gryphon/main/sidebar-standard.tpl' %}


</div>

<hr class="spacer" />

{% endblock content %}

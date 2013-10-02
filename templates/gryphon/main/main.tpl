{# gryphon/main/main.tpl #}

{% extends "gryphon/base.tpl" %}

{% block active %}home{% endblock %}

{% block content %}
{% import "macros/article.tpl" as articleRender %}
{% import "macros/render.tpl" as render %}
{% helper disqusPopular as popular %}
{% fetch centerpiece from article with [
	'order': 'weight desc, created desc',
	'limit': '1',
	'where': 'status = 1',
	'withTags': ['front_page', 'photo']
] %}

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

		<div class="row-fluid">
			<div class="span7">
				{{ articleRender.topStory(centerpiece[0]) }}
			</div>
			<section class="span5 latest-box">
				<header><h2><em>the</em> Latest</h2></header>
				
				{# Limits Latest to only three articles accounting for #}
				{# possibility of centerpiece getting pulled into secondary also #}
				
					{% set count = 0 %}
					{% for article in articles.shift(4) %}
						{% if article.title == centerpiece[0].title %} {# check for centerpiece #}
							
						{%else%}
							{%if count > 2 %}
							{% else %}
								{{ articleRender.secondaryNoPhoto(article) }}
								<hr class="double spacer" />
								{% set count = count + 1 %}
							{% endif %}
						{%endif%}
						
					{% endfor %}

 			</section>
		</div>

		<hr class="double spacer" />

		<div class="row-fluid">
			<div class="span12">

				{% include 'gryphon/multimedia/slider.tpl' with ['tags':['carousel']] %}

			</div>
		</div>
	{% include 'gryphon/main/rundown.tpl' %}
	</div>

	<div class="span4 hidden-phone hidden-tablet">
		<div class="sidebar-wrap">

			{% include 'gryphon/ads/rectangle.tpl' %}

			{#<hr class="spacer" />

			{% include 'gryphon/main/disqus-box.tpl' %}#}

	        <hr class="spacer" />
		</div>

			<div class="row-fluid">

	    			<div class="sidebar-wrap">
	    			<div class="pull-left">
	    				<a href="https://www.facebook.com/theaueagle"><img src="{{ 'assets/dist/img/fb_large.png' | asset }}" alt="Facebook" /></a></div>
	    		  	</div>




	  				<div class="sidebar-wrap">
	  					<a href="https://twitter.com/TheEagleOnline">
	  						<div class="pull-right">
	  							<img src="{{ 'assets/dist/img/twt_large.png' | asset }}" alt="Twitter" /></a>
	  						</div>

	  			</div>
			</div>


		<div class="sidebar-wrap">

			<hr class="spacer" />
			{% if active == "home"%}
				{% include 'gryphon/main/columns.tpl' %}
			{% endif %}

			<hr class="spacer" />

			{% include 'tsn/poll/recent.tpl' %}

			<hr class="spacer" />

			{#{% include "pre1/featured.tpl" %}#}

		</div>

	</div>


</div>
<hr class="double spacer" />
{% include 'gryphon/main/eaglestories.tpl' %}
<hr class="double spacer" />

{% endblock content %}

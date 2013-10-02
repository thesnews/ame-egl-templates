{% fetch items from media with [
	'order': 'weight desc, created desc',
	'limit': 4,
	'withTags': tags,
	'where': 'status = 1'
] %}
{% if items.length %}
	<section class="row-fluid multimedia-slider">
	<!--gryphon/multimedia/slider.tpl-->
		<div class="span12">
			<header>
				<h2><a href="{{ 'multimedia'|url }}">Multimedia</a></h2>
			</header>
			<hr class="spacer">
			<div id="myCarousel" class="carousel slide">
			  <!-- Carousel items -->
			  <div class="carousel-inner">
			  	{% set bool = true %}
			    {% for item in items %}
				    <div class="item {% if bool == true  %}active {% set bool = false %}{% endif %}">
				    	<a href="{{ item.urlDefault }}"><img src="{{ item.url }}"/></a>
				    	{% if item.title or item.authors.length %}
					    	<div class="carousel-caption">
					    		{% if item.title %}
									<h3><a href="{{ item.urlDefault }}">{{ item.title }}</a></h3>
								{% endif %}
					    	</div>
				    	{% endif %}
				    </div>

			    {% endfor %}
			  </div>
			  <!-- Carousel nav -->
			  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
			</div>
		</div>
	</section>
{% endif %}

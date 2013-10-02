{# gryphon/main/eaglestories.tpl #}
<div class="eagle-stories">
	<header>
		<h2><strong>EAGLE</strong></h2>
		<h3><em>stories</em></h3>
		<span class="eagle-nav-arrows">
			<a href="#" id="prev"><img src="{{ 'assets/dist/img/leftarrow.png' |asset }}" alt="left arrow" /></a> <a href="#" id="next"><img src="{{ 'assets/dist/img/rightarrow.png' |asset }}" alt="right arrow" /></a>
		</span>
	</header>

	<div id="gallery">
	  <div id="slider">

			{% if section.slug != 'pageone' %}
				{% fetch arts from article with [
					'order': 'weight desc, created desc',
					'limit': 10,
					'where': 'status = 1'
				] %}


				{% for art in arts %}

					{{ articleRender.eagleStories(art) }}
				{% endfor %}

			{% else %}
				{% for art in articles.shift(10) %}
					{{ articleRender.eagleStories(art) }}
				{% endfor %}
			{% endif %}

	  </div>
	</div>
</div>
<script>
	var gal = $('#gallery');
	var galW = 221;
	var slider = $('#slider');
	var box = $('div', slider);
	var boxN = box.length;

	var c = 0; // a counter

	slider.width(galW*boxN);

	var t = setInterval(function() {
		$('#next').click();
	}, 5000);

	$('.eagle-stories').mouseenter(function(e) {
		if( t ) {
			clearInterval(t);
		}
	});

	$('#prev, #next').click(function(e){
	  e.preventDefault();
	  var dir = this.id=='next' ? c++ : c-- ;
	  c = c<0 ? boxN-1 : c%boxN;
	  slider.stop().animate({ left: -c*galW },800);
	});
</script>

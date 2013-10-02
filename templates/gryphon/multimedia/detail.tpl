<!-- gryphon/multimedia/detail.tpl -->
<div class="row-fluid">
<div class="multimedia">
	<div class="detail">
		<header><h2>{{ topMedia.title|default(topMedia.type) }}</h2></header>
			<hr class="spacer" />
		{{ mediaRender.media(topMedia) }}
			<hr class="half spacer" />
		<aside class="credit">
			{% if topMedia.authors.length %}
				By {{ topMedia.authors.splat('name')|join(', ') }}
			{% else %}
				&nbsp;
			{% endif %}
			
			<span class="pull-right">
				{{ topMedia.created|timeSince }}
			</span>
		</aside>

		<div class="row-fluid">
			<p class="copy">{{ topMedia.caption_formatted }}</p>
		</div>
	
		<div class="row-fluid">
			<div class="pull-left">
				<ul class="share">
					<li><a href="http://www.facebook.com/theaueagle"><img src="{{ 'assets/dist/img/facebook_logo.png'|asset }}" alt="Facebook Logo"/></a></li>
					<li><a href="http://twitter.com/theeagleonline"><img src="{{ 'assets/dist/img/twitter-logo.png'|asset }}" alt="Twitter Logo"/></a></li>
					<li><a href="http://twitter.com/theeagleonline"><img src="{{ 'assets/dist/img/email_icon.png'|asset }}" alt="Email Icon"/></a></li>
				</ul>
			</div>
		</div>
			<hr class="double spacer" />

			<div class="fb-comments" data-href="{{ topMedia.url }}"></div>

			<hr class="double hairline clearfix" />
	</div>
	{% include 'gryphon/multimedia/more.tpl' %}
	
</div>
		
	</div>
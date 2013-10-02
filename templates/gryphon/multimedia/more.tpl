<!-- gryphon/multimedia/more.tpl -->


<div class="row-fluid">
<div class="multimedia">
	<div class="span4">
		<div class="rundown-box">
			{% fetch videos from gryphon:media with [
				'where': '(type = "vimeo" or type = "youtube") and status = 1',
				'order': 'created desc',
				'limit': 4
			] %}
			<h3><header><em><a href="{{ 'multimedia/video'|url }}">Video</a></em></header></h3>
				<hr class="spacer clearfix" />
			<ul class="unstyled">
				{% for video in videos %}
					<li>

						<h4><a href="{{ video.urlDefault }}">{{ video.title }}</a></h4>
						<aside class="credit">
							{% if video.authors.length %}
								By {{ video.authors.splat('name')|join(', ') }}
							{% else %}
								&nbsp;
							{% endif %}
							<span class="pull-right">{{ video.created|timeSince }}</span>
						</aside>
						<div class="photo-wrap" style="height:125px;">
							<a href="{{ video.urlDefault }}">
								<img src="{{ video.urlPreview }}" style="max-height:125px;" />
							</a>
						</div>
						<hr class="spacer" />

					</li>
				{% endfor %}
			</ul>
		</div>
	</div>

	<div class="span4">
		<div class="rundown-box">
			{% fetch gals from gryphon:gallery with [
				'where': 'status = 1',
				'order': 'created desc',
				'limit': 4
			] %}

				<h3><header><em><a href="{{ 'gallery'|url }}">Galleries</a></em></header></h3>

			<hr class="spacer" />
			<ul class="unstyled">
				{% for gal in gals %}
					<li>
						<h4><a href="{{ gal.urlDefault }}">{{ gal.title }}</a></h4>
						<aside class="credit">
							<span class="pull-right">{{ gal.created|timeSince }}</span>
						</aside>

						<div class="photo-wrap" style="height:125px;">
							<a href="{{ gal.urlDefault }}">
								<img src="{{ gal.urlPreview }}" style="max-height:125px;" />
							</a>
						</div>
					<hr class="half spacer" />

				</li>
				{% endfor %}
			</ul>
		</div>
	</div>

	<div class="span4">
		<div class="rundown-box">
			{% fetch graphics from gryphon:media with [
				'where': 'status = 1 and type = "image"',
				'order': 'created desc',
				'withTags':['graphic'],
				'limit': 4
			] %}
				<h3><header><em><a href="{{ 'multimedia/graphic'|url }}">Graphics</a></em> </header></h3>
			<hr class="spacer clearfix" />
			<ul class="unstyled">
				{% for graphic in graphics %}
					<li>
						<h4><a href="{{ graphic.urlDefault }}">{{ graphic.title }}</a></h4>
						<aside class="credit">
							By {{ graphic.authors.splat('name')|join(', ') }}
							<span class="pull-right">{{ graphic.created|timeSince }}</span>
						</aside>
						<div class="photo-wrap" style="height:125px;">
							<a href="{{ graphic.urlDefault }}">
								<img src="{{ graphic.urlPreview }}" style="max-height:125px;" />
							</a>
						</div>

							<hr class="half spacer clearfix" />

					</li>
				{% endfor %}
			</ul>
		</div>
	</div>

</div>
</div>
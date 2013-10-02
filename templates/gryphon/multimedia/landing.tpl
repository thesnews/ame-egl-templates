<!-- gryphon/multimedia/landing.tpl -->


	<div class="row-fluid">
	
		<div class="multimedia">
		<div class="span12">
			{% for item in media.shift(1) %}
		
				<div class="photo-wrap">
					<figure>
						<a href="{% if item.gallery %}{{ item.gallery.urlDefault }}{% else %}{{ item.urlDefault }}{% endif %}">
							<img src="{{ item.urlPreview }}"/>
						</a>
					
						<figcaption>
							<div class="row-fluid">
								<h4 class="pull-left"><a href="{{ item.urlDefault }}">{{ item.fileType|capitalize }}: {{ item.title }}</a></h4>
							</div>
								<hr class="half spacer" />
							<span class="row-fluid">
								<div class="pull-left">
									{% if item.authors.length %}
										<p>{{ item.authors.splat('name')|join(', ') }}</p>
									{% else %}
										&nbsp;
									{% endif %}
								</div>
								
								<div class="pull-right">
									<p>{{ item.created|timeSince }}</p>
								</div>
							</span>
						</figcaption>
					</figure>
				</div>
			{% endfor %}
		</div>
	</div>

	<div class="row-fluid">
		{% for item in media.shift(4) %}
			{% if loop.index%2 %}
	</div>
		<div class="row-fluid">
			{% endif %}
			<div class="span6">
					<hr class="spacer clearfix" />
				<div class="photo-wrap" style="width:100%">
					<figure>
						<a href="{% if item.gallery %}{{ item.gallery.urlDefault }}{% else %}{{ item.urlDefault }}{% endif %}">
							<img src="{{ item.urlPreview }}" style="max-height:200px;"/>
						</a>
					
						<figcaption>
							<div>
								<div class="row-fluid">
									<h4 class="pull-left"><a href="{{ item.urlDefault }}">{{ item.fileType|capitalize }}: {{ item.title }}</a></h4>
								</div>
								<div class="row-fluid">
									<div class="pull-left">
										{% if item.authors.length %}
											<p>{{ item.authors.splat('name')|join(', ') }}</p>
										{% else %}
											&nbsp;
										{% endif %}
									</div>
									<div class="pull-right">
										<p>{{ item.created|timeSince }}</p>
									</div>
								</div>
							</div>
						</figcaption>
						
					</figure>
				</div>
			</div>
		{% endfor %}
		</div>

		<hr class="double hairline clearfix" />
</div>
{% include 'gryphon/multimedia/more.tpl' %}



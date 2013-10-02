{% macro topStory(article) %}
	{% set image = article.media.grab('type','image')[0] %}
	<article class="topStory">
			{% if image %}
				<figure>
					<div class="text-center">
					<a href="{{ article.url }}"><img src="{{ image.url }}" alt="{{ article.title }}"/></a>
					</div>
					{% if image.caption or image.authors.length %}
					<figcaption>
					<span id="photocredit">

					    {% if image.authors.length %}
								<span>Photo: {{ image.authors.splat('name')|join(', ') }}</span><br/>
							{% endif %}
							{% if image.caption %}
								{{ image.caption_formatted }}
							{% endif %}
					</span>


					</figcaption>
				{% endif %}
				</figure>
			{% endif %}
		<hr class="half spacer" />

			<h1><a href = "{{ article.url }}">{{ article.title }}</a></h1>
			<hr class="half spacer clearfix" />
				<aside>
					{% if article.authors.length %}
						<span class="author pull-left">By {{ article.authors.splat('name')|join(', ') }}</span>
					{% endif %}
					<span class="pubdate pull-right"> {{ article.created|timeSince }}<span>
				</aside>
		<p>
			{% if article.abstract.length > 250 %}
				{{ article.abstract| clip(250) }} <a href = "{{ article.url }}">More</a>
			{% else %}
				{{ article.abstract }}
			{% endif %}
		</p>
	</article>
{% endmacro %}


{% macro topStorySection(article) %}
	{% set image = article.media.grab('type','image')[0] %}
	<article class="topStory">
		<h1><a href = "{{ article.url }}">{{ article.title }}</a></h1>
			<hr class="half spacer clearfix" />
				<aside>
					{% if article.authors.length %}
						<span class="author pull-left">By {{ article.authors.splat('name')|join(', ') }}</span>
					{% endif %}
					<span class="pubdate pull-right"> {{ article.created|timeSince }}<span>
				</aside>
			{% if image %}
				<hr class="half spacer clearfix" />
				<figure>
					<div class="text-center">
					<a href="{{ article.url }}"><img src="{{ image.url }}" alt="{{ article.title }}"/></a>
					</div>
					{% if image.caption or image.authors.length %}
						<figcaption class="hidden-phone">
							<div>
							{% if image.authors.length %}
								<span>Photo: {{ image.authors.splat('name')|join(', ') }}</span><br/>
							{% endif %}
							{% if image.caption %}
								{{ image.caption_formatted }}
							{% endif %}
							</div>
						</figcaption>
					{% endif %}
				</figure>
				<hr class="spacer clearfix" />
			{% endif %}
		<p>
			{% if article.abstract.length > 250 %}
				{{ article.abstract| clip(250) }} <a href = "{{ article.url }}">More</a>
			{% else %}
				{{ article.abstract }}
			{% endif %}
		</p>
	</article>
{% endmacro %}

{% macro secondary(article) %}
	<article class="secondaryStory">
		<h3><a href="{{ article.url }}">{{ article.title }}</a></h3>
		<aside>
			{% if article.authors.length %}
				<span class="author pull-left">By {{ article.authors.splat('name')|join(', ') }}</span>
			{% endif %}
			<span class="pubdate pull-right"> {{ article.created|timeSince }}<span>
		</aside>

		<p>{{ article.abstract | clip(150) }} <a href="{{ article.url }}">Read More</a><p>

	</article>
{% endmacro %}


{% macro secondaryNoPhoto(article) %}
	<article class="secondaryStory">
		<h3><a href="{{ article.url }}">{{ article.title }}</a></h3>
		<aside>
			{% if article.authors.length %}
				<span class="author pull-left"> {{ article.authors.splat('name')|join(', ') }}</span>
			{% endif %}
			<span class="pubdate pull-right">{{ article.created|timeSince }}<span>
		</aside>

		<p>{{ article.abstract | clip(150) }} <a href="{{ article.url }}">Read More</a><p>

	</article>
{% endmacro %}


{% macro rundown(article) %}
{% set image = article.media.grab('type','image')[0] %}
	<article class="row-fluid">
	<div class="rundownStory">
		<h3><a href="{{ article.url }}">{{ article.title }}</a></h3>
		<aside>
			{% if article.authors.length %}
				<span class="author pull-left">By {{ article.authors.splat('name')|join(', ') }}</span>
			{% endif %}
			<span class="pubdate pull-right">{{ article.created|timeSince }}<span>
		</aside>
		{% if image %}
		<div class="photo-wrap pull-left">
			<a href="{{ article.url }}"><img src="{{ image.url }}" alt="{{ article.title }}"/></a>
			</div>
		{% endif %}
		<p>{{ article.abstract | clip(250) }}</p>
			</div>
			<hr class="spacer" />
	</article>
	<hr class="spacer" />
{% endmacro %}


{% macro sidebarRun(article) %}
	<article class="sidebarRun">
		<h4><a href = "{{ article.url }}">{{ article.title }}</a></h4>
			<aside>
			{% if article.authors.length %}
				<span class="author pull-left">By {{ article.authors.splat('name')|join(', ') }}</span>
			{% endif %}
			<span class="pubdate pull-right">{{ article.created|timeSince }}<span>
		</aside>
		<hr class="spacer" />
	</article>
{% endmacro %}


{% macro topStoryNoPhoto(topStory) %}
	{% set mugs = topStory.media.grab('meta', 'mugshot', true) %}

	<article class="row-fluid">
		<h1><a href="{{ topStory.url }}">{{ topStory.headline }}</a></h1>
		<hr class="half spacer" />
		<aside>
			{% if topStory.authors.length %}
				By {{ topStory.authors.splat('name')|join(', ') }}
			{% else %}
				&nbsp;
			{% endif %}
			<div class="pull-right">
				 {{ topStory.created|timeSince }}
			</div>
		</aside>
		<hr class="half spacer clearfix" />
		<p>
			{% if mugs.length %}
				<a href="{{ topStory.url }}"><img src="{{ mugs[0].url }}" class="inline" /></a>
			{% endif %}
			{{ topStory.abstract|clip(250) }}
		</p>
		<a href="{{ topStory.url }}" class="btn btn-primary">Read More</a>
	</article>
{% endmacro %}


{% macro eagleStories(article) %}
	<div>
		{% set topMedia = article.media.grab('type', 'image')[0] %}
		<article class="clearfix">
			{% if topMedia %}
				<a href="{{ article.url }}"><img src="{{ topMedia.urlPreview }}" style="max-width:120px;" /></a>
				<hr class="half spacer" />
			{% endif %}
			<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
		</article>
	</div>
{% endmacro %}


{% macro short(article) %}
	{% set topMedia = article.media.grab('type', 'image')[0] %}
	<article class="clearfix">
		{% if topMedia %}
			<a href="{{ article.url }}"><img src="{{ topMedia.urlPreview }}" style="max-width:120px;" /></a>
			<hr class="half spacer" />
		{% endif %}
		<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
		<aside>
			{% if article.authors.length %}
				By {{ article.authors.splat('name')|join(', ') }}
			{% else %}
				&nbsp;
			{% endif %}
			<div>
				{{ article.created|timeSince }}
			</div>
		</aside>
	</article>
{% endmacro %}


{% macro column(article) %}
	{% set topMedia = article.media.grab('meta', 'mugshot')[0] %}
	<article>
		{% if topMedia %}
			<span class="pull-left"><a href="{{ article.url }}"><img src="{{ topMedia.urlPreview }}" style="max-width:120px;margin:0 5px 5px 0;" /></a></span>
			<hr class="half spacer" />
		{% endif %}
		<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
		<aside>
			{% if article.authors.length %}
				By: {{ article.authors.splat('name')|join(', ') }}
			{% else %}
				&nbsp;
			{% endif %}
		</aside>
	</article>
{% endmacro %}



<!-- gryphon/media/image.tpl -->

<img src="{{ media.url }}" />
<hr class="double spacer" />
<div class="media-caption" style="max-width:500px;">
	<aside>{{ media.authors.splat('name')|join(', ') }} / {% if media.source %}{{ media.source }}{% endif %}</aside>
	<hr class="half spacer" />
	{{ media.caption_formatted }}
	{% if media.gallery %}
		<a href="{{ media.gallery.urlDefault }}" class="btn btn-primary pull-right"><i class="icon-picture icon-white"></i> View full gallery</a>
	{% endif %}
	{% if media.articles.length %}
		<a href="{{ media.articles[0].url }}" class="btn btn-primary pull-left"><i class="icon-list-alt icon-white"></i> Related article</a>
	{% endif %}
</div>

<!--media/image_preview.tpl-->

<div class="image">
	<a href="{% if media.gallery %}{{ media.gallery.urlDefault }}{% else %}{{ media.urlDefault }}{% endif %}"><img src="{{ media.url }}" /></a>
</div>

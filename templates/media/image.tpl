<!--media/image.tpl-->

<div class="image">
	<div style="text-align: center;">
	<a href="{{ media.urlDefault }}"><img src="{{ media.url }}" /></a>
	</div>
	<div class="info">
		{{ media.authors.splat('name')|join(', ') }}
		&middot; {{ media.source }}

	</div>
</div>

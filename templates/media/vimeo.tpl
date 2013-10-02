{#media/vimeo.tpl#}

<iframe src="//player.vimeo.com/video/{{ media.extended.id|default(media.base_name) }}" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="http://vimeo.com/{{ media.extended.id|default(media.base_name) }}">{{media.title}}</a> from <a href="http://vimeo.com/{{config.get('vimeo:userid')}}">{{config.get('vimeo:username')}}</a> on <a href="https://vimeo.com">Vimeo</a>.</p>


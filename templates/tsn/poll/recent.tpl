{# tsn/poll/recent.tpl #}

{% fetch poll from tsn:poll with [
	'where': 'status = 1',
	'order': 'created desc',
	'limit': 1
] %}

<header class="box"><h2 class = "pollHead"><em>today's</em> Poll</h2></header>
<div class="box-content">

	<p>{{ poll[0].question }}</p>
	{% if poll[0].userHasVoted %}

		<ul class="unstyled">
		{% for response in poll[0].responses %}
			<li>{{ response.percent }}%: {{ response.answer }}</li>
		{% endfor %}
		</ul>

		<span class="small"><a href="{{ poll[0].url }}">View results</a> | <a href="{{ 'tsn:poll/archive'|url }}">Poll archive</a></span>

	{% else %}

		<form method="post" action="{{ poll[0].urlSubmit }}">
			<ul class="unstyled">
			{% for id,response in poll[0].answers %}
				<li><label for="{{ id }}"><input type="radio" name="answer" value="{{ id }}" id="{{ id }}"> {{ response }}</label></li>
			{% endfor %}
			</ul>

			<hr class="spacer" />

			<input class="btn btn-primary" type="submit" value="Vote" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="small"><a href="{{ poll[0].url }}">View results</a> | <a href="{{ 'tsn:poll/archive'|url }}">Poll archive</a></span>
		</form>

	{% endif %}
</div>
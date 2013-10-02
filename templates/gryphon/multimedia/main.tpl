{# gryphon/multimedia/main.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}

{% block bodyClass %}multimedia{% endblock %}

{% block content %}
{% helper request %}

{% import 'macros/render.tpl' as mediaRender %}

{% set topMedia = false %}

{% if request.getSegment(1) %}
	{% set topMedia = media.shift() %}
{% endif %}


<div class="row-fluid">

	<div class="span8">



		{% if not topMedia %}
			{% include 'gryphon/multimedia/landing.tpl' %}
		{% else %}
			{% include 'gryphon/multimedia/detail.tpl' %}
		{% endif %}
	</div> <!-- closes span8 -->


	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>
<hr class="spacer" />


{% endblock content %}

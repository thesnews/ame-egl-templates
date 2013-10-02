{# google/calendar/tos.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: Event Calendar {% endblock %}
{% block active %}features{% endblock %}

{% block scripts %}
{% endblock %}

{% block styles %}
<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'style/gryphon/screen/calendar.css'|url }}" />
{% endblock %}

{% block content %}
<div class="row">
	<div class="span8">
		<div class="sectionalheading">
			<h1> State News Events Calendar</h1>
			
			<hr class="hairline">
		</div>		
		
		<div class="row-fluid">
			<div class="span3">
				{% include 'google/calendar/sidebar.tpl' %}
			</div>
			<div class="span9">
		
				<h2>Terms of Service: Event Calendar</h2>
				<h5>Last Update: November 08, 2010.</h5>
				
				<p>Event listings and associated links are provided and maintained by third parties to The State News. The State News takes no responsibility for the content thereof. Users are solely responsible for reviewing and making decisions and agreements or contracts based on the information provided in this Event Calendar and agrees to hold The State News harmless and waives any liability of The State News for any or all disputes involving information provided in this guide.</p>
				
				<p>Although most changes are likely to be minor, The State News may change its Event Calendar Terms of Service from time to time, and in The State News's sole discretion. The State News encourages visitors to frequently check this page for any changes to its Event Calendar Terms of Service. Your continued use of this site after any change in this Terms of Service policy will constitute your acceptance of such change.</p>
				<h4>Want to get listed?</h4>
				<p><a href="{{ 'google:calendar/submit'|url }}">Tell is about your event</a> to be listed in the Happenings Event Calendar.</p>
			</div>
		</div>
	</div>

	{% include "gryphon/main/sidebar-standard.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}
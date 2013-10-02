{# google/calendar/event.tpl #}

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
		<h1> State News Events Calendar</h1>

		<hr class="hairline">

	
		<div class="row-fluid">	
			<div class="span12">
				
							<table id="calendar-single">
								<tr>
									<td><h2>{{ event.title }}</h2></td>
								</tr>
								<tr>
									{% if event.allDay %}
										<td><h4>{{ event.start_time|date('l, F jS, Y') }}</h4></td>
									{% else %}
										<td><h4>{{ event.start_time|date('l, g:ia, F jS, Y') }}</h4></td>
									{% endif %}
								</tr>
								<tr>
									<td><h4>{{ event.location }}</h4></td>
								</tr>
								<tr>
									<td><a href="{{ event.calendar.url }}">{{ event.calendar.title }}</td>
								</tr>
								<tr>
									<td>{{ event.content_formatted }}</td>
								</tr>
								<tr>
											<td><img src=' http://maps.google.com/maps/api/staticmap?center={{ event.coordinates }}&markers={{ event.coordinates }}|color:{{ event.category.color }}&zoom=12&size=500x300&sensor=false'/></td>
								</tr>
							</table>
						
						<hr class="hairline" />
					
						<div class="side-box">
							<div class="box">
								<h4>Have an event?</h4>
								<hr class="spacer" />
								<p>Let the MSU/East Lansing community know about it, <a href="{{ 'google:calendar/submit'|url }}">submit your events now</a>!</p>
							</div>
						</div>
						
						<hr class="spacer" />
						
							<p class="small">Continued use of this service implies acceptance of the <a href="{{ 'google:calendar/tos'|url }}">Terms of Service</a>.</p>

			</div>
		</div>
	</div> <!-- end of span8 -->
	
	{% include "gryphon/main/sidebar-standard.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}

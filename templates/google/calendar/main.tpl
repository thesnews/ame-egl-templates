{# google/calendar/main.tpl #}

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
				<div class="span3">
					{% include 'google/calendar/sidebar.tpl' %}
				</div>
				

				<div class="span9">
					<div id="calendar-results">

						{% if events.length %}
							<div class="pagination">
								<ul>
								{% for page in pagination %}
									{% if page.isCurrent %}
										<li class="disabled"><a href="#">{{ page.label }}</a></li>
									{% else %}
										<li><a href="{{ page.url }}">{{ page.label }}</a></li>
									{% endif %}
								{% endfor %}
								</ul>
							</div>
							
							<hr class="spacer" />
							
							<ul class="unstyled">
							{% set currentDate = events[0].start_time|date('M dS, l') %}
								<li><h5>{{ currentDate }}</h5>
								{% for event in events %}
	
									{% set thisDate = event.start_time|date('M dS, l') %}
									{% if currentDate != thisDate %}
										{% set currentDate = thisDate %}
										</li>
										<li><h4>{{ thisDate }}</h4>
									{% endif %}
									<div class="clearfix">
										<h3><a href="{{ event.url }}">{{ event.title }}</a></h3>
										
										<em>{% if not event.allDay %}{{ event.start_time|date('g:i a') }}<br/>{% endif %}{{ event.location }}</em>
										<p>{{ event.abstract }} <a href="{{ event.url }}">More»	</a></p>
										<span>Calendar: <a href="{{ event.calendar.url }}">{{ event.calendar.name }}</a></span>
									</div>
								
								<hr class="hairline" />
								{% endfor %}
								</li>
							
							</ul>

							<div class="pagination">
								<ul>
								{% for page in pagination %}
									{% if page.isCurrent %}
										<li class="disabled"><a href="#">{{ page.label }}</a></li>
									{% else %}
										<li><a href="{{ page.url }}">{{ page.label }}</a></li>
									{% endif %}
								{% endfor %}
								</ul>
							</div>


						{% else %}


							<h4>Dang...</h4>

							<hr class="spacer" />

							<div class="smaller">
								Hmmm... no events found for this day and/or category.

								<hr class="spacer" />
								{% fetch next from google:calendarEvent with [
									'where': 'start_time > :ts',
									'limit': 1,
									'order': 'start_time asc',
									'bind': [':ts': timestamp]
								] %}

								{% if next %}
									Looks like the next date we have events for is <a href="{{ 'google:calendar'|url(['time':next[0].start_time]) }}">{{ next[0].start_time|date('m/d/Y') }}</a>.
								{% endif %}
							</div>
						{% endif %}
					</div>

					<hr class="double spacer" />

					<hr class="spacer" />
					<div class="side-box">
						<div class="box">
						<p>Continued use of this service implies acceptance of the <a href="{{ 'google:calendar/tos'|url }}">Terms of Service</a>.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	{% include "gryphon/main/sidebar-standard.tpl" %}
</div>

<hr class="spacer" />

{% endblock content %}
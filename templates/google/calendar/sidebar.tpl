{# google/calendar/sidebar.tpl #}

{% helper calendar %}
<div class="rundown-box">
	<div class="box">
		
		<h4>Have an event?</h4>
				<hr class="spacer" />
				Let the MSU/East Lansing community know about it, <a href="{{ 'google:calendar/submit'|url }}">submit your events now</a>!
		
				<hr class="double spacer" />
		
				{{ calendar.setTime(timestamp) }}
				<table id="side-calendar" cellspacing="0">
					<tbody>
						<tr class="month">
							<td><a href="{{ 'google:calendar'|url(['time': calendar.previousTime]) }}">&#171;</a></td>
							<td colspan="5">{{ calendar.name }}</td>
							<td><a href="{{ 'google:calendar'|url(['time': calendar.nextTime]) }}">&#187;</a></td>
						</tr>
						<tr class="day">
						{% for day in ['Su', 'M', 'Tu', 'W', 'Th', 'F', 'Sa'] %}
							<th{% if loop.index0 == calendar.now|date('w') %} class="selected"{% endif %}>{{ day }}</th>
						{% endfor %}
						</tr>
						{% for week in calendar.weeks %}
							<tr{% if week.isCurrent() %} class="selected"{% endif %}>
							{% for day in week.days %}
								{% if day.isCurrentMonth() %}
									<td><a href="{{ 'google:calendar'|url(['time':day.time]) }}"{% if day.isCurrent() %} class="selected"{% endif %}>{{ day.date }}</a></td>
								{% else %}
									<td>&nbsp;</td>
								{% endif %}
							{% endfor %}
							</tr>
						{% endfor %}
					</tbody>
				</table>
				
				<hr class="double spacer" />
		
				
				<h4>Show me:</h4>
				<ul class="unstyled">
					<li><a href="{{ 'google:calendar'|url }}">Most Recent</a></li>
					<li><a href="{{ 'google:calendar'|url(['range':'week']) }}">Current Week</a></li>
					<li><a href="{{ 'google:calendar'|url(['range':'month']) }}">Current Month</a></li>
					{% if timestamp %}
						{% set week = calendar.build('week', timestamp) %}
						<li><a href="{{ 'google:calendar'|url(['range':'week','time':week.days[0].time]) }}">Week of {{ week.days[0].time|date('m/d') }}</a></li>
					{% endif %}
				</ul>
		
				<hr class="double spacer" />
		
				<h4>Categories:</h4>
				<ul class="unstyled">
					{% fetch calendars from google:calendar with [
						'order': 'title asc'
					] %}
				{% for calendar in calendars %}
					<li><a href="{{ calendar.url }}?time={{ timestamp }}">{{ calendar.name }}</a></li>
				{% endfor %}
				</ul>
	</div>
</div>
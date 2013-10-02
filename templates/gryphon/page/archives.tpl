{# gryphon/page/archives.tpl #}
{% extends "gryphon/base.tpl" %}
{% block title %}:: Archives{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}{% endblock %}

{% block content %}

{% set months = [
	'01': 'January',
	'02': 'February',
	'03': 'March',
	'04': 'April',
	'05': 'May',
	'06': 'June',
	'07': 'July',
	'08': 'August',
	'09': 'September',
	'10': 'October',
	'11': 'November',
	'12': 'December'
] %}
<div class="row">
	<div class="span8">
		<h1>Archives</h1>

		<hr class="hairline"/>

		<hr class="spacer" />

		<h3>Search</h3>
		<form method="get" action="{{ 'gryphon:search'|url }}" class="form-inline">
			<div class="input-append">
				<input class="input-xxlarge" type="text" name="q" value="{{ query }}" placeholder="Search The Eagle" /><span class="add-on"><i class="icon-search"></i></span>
			</div>
			<input type="submit" value="Quick Search" class="btn btn-primary" />
			<hr class="spacer" />
			<a href="{{ 'gryphon:search'|url(['a':1]) }}" class="smaller">Advanced search <i class="icon-chevron-right"></i></a>
		</form>

		<hr class="double hairline" />

		<h3>Quick Date Search</h3>

		<form method="get" action="/index.php/search/" class="form-horizontal">
			<input type="hidden" name="a" value="1" />

			<div class="control-group">
				<label class="control-label">From:</label>
				<div class="controls">
					<select name="ts_month">
						<option value="0">Month</option>
						{% for val,label in months %}
							<option value="{{ val }}"{% if query.time_startMonth == val %} selected="selected"{% endif %}>{{ label }}</option>
						{% endfor %}
					</select>
					<select name="ts_day" class="span1">
						<option value="0">Day</option>
					{% for i in 1..31 %}
						<option value="{{ i }}"{% if query.time_startDay == i %} selected="selected"{% endif %}>{{ i }}</option>
					{% endfor %}
					</select>
					<select name="ts_year" class="span2">
					<option value="0">Year</option>
					{% set b = 2001 %}
					{% set n = now|date('Y') %}

					{% for i in b..n %}
						<option value="{{ i }}"{% if query.time_startYear == i %} selected="selected"{% endif %}>{{ i }}</option>
					{% endfor %}
					</select>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">To:</label>
				<div class="controls">
					<select name="te_month">
						<option value="0">Month</option>
						{% for val,label in months %}
							<option value="{{ val }}"{% if query.time_endMonth == val %} selected="selected"{% endif %}>{{ label }}</option>
						{% endfor %}
					</select>
					<select name="te_day" class="span1">
						<option value="0">Day</option>
					{% for i in 1..31 %}
						<option value="{{ i }}"{% if query.time_endDay == i %} selected="selected"{% endif %}>{{ i }}</option>
					{% endfor %}
					</select>
					<select name="te_year" class="span2">
					<option value="0">Year</option>
					{% set b = 2001 %}
					{% set n = now|date('Y') %}

					{% for i in b..n %}
						<option value="{{ i }}"{% if query.time_endYear == i %} selected="selected"{% endif %}>{{ i }}</option>
					{% endfor %}
					</select>
				</div>
			</div>

			<hr class="spacer" />
			<div class="form-actions">
				<input type="submit" value="Search by Date" class="btn btn-primary" />
			</div>
		</form>

		<hr class="spacer" />
	</div>

	{% include 'gryphon/main/sidebar-standard.tpl' %}

</div>

{% endblock content %}
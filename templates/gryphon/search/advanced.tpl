{# gryphon/search/advanced.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: Advanced Search{% endblock %}

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

{% set types = [
	'article',
	'media',
	'page',
	'section',
	'comment'
] %}

<div class="row-fluid">
	<div class="span8">

		<h1>
			{% if query	%}
				Search Results
			{% else %}
				Advanced Search
			{% endif %}
		</h1>
		<hr class="spacer" />

		{% if query %}
			<p class="copy">Below are your search results. You can also try a <a href="{{ 'search'|url }}">Basic Search</a>.</p>
		{% else %}
			<p class="copy">Use the field below to perform an advanced search of The Eagle's archives. This will return articles, images, and multimedia relevant to your query. You can also try a <a href="{{ 'search'|url }}">Basic search</a></p>
		{% endif %}

		<hr class="spacer" />

		<form method="get" action="{{ 'gryphon:search'|url }}" class="form-horizontal">
			<input type="hidden" name="a" value="1" />

			<div class="control-group">
				<label for="input_search" class="control-label">Find:</label>
				<div class="controls"> 
					<input type="text" id="input_search" name="s" class="input-xlarge" style ="color:#333" value="{{ query.subject }}" placeholder=" " />
				</div>
			</div>
			<div class="control-group">
				<label for="input_title" class="control-label">Title/Headline:</label>
				<div class="controls">
					<input type="text" id="input_title" name="ti" class="input-xlarge" style ="color:#333" value="{{ query.title }}" placeholder=" " />
				</div>
			</div>

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


			<div class="control-group">
				<label for="input_author" class="control-label">Writer/Photographer:</label>
				<div class="controls">
					<input type="text" id="input_author" name="au" size="30" class="input-xlarge" style ="color:#333" value="{{ query.author }}" placeholder=" "/>
				</div>
			</div>

			<div class="control-group">
				<label for="input_tag" class="control-label">Tagged:</label>
				<div class="controls">
					<input type="text" id="input_tag" name="tg" size="30" class="input-xlarge" style ="color:#333" value="{{ query.tag }}" placeholder=" " />
				</div>
			</div>

			<div class="control-group">
				<label for="input_type" class="control-label">Type:</label>
				<div class="controls">
					<select name="ty" id="input_type">
						<option value="0">Any</option>
						{% for val in types %}
							<option value="{{ val }}"{% if query.type == val %} selected="selected"{% endif %}>{{ val }}</option>
						{% endfor %}
					</select>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Order by:</label>
				<div class="controls">
					<label class="radio">
						<input type="radio" name="o" value="date"{% if query.order == 'date' %} checked{% endif %} /> Date
					</label>
					<label class="radio">
						<input type="radio" name="o" value="title"{% if query.order == 'title' %} checked{% endif %} />Title
					</label>
				</div>
			</div>


			<hr class="spacer" />
			<div class="form-actions">
				<input type="submit" value="Search" class="btn btn-primary" />
			</div>
		</form>

		<hr class="spacer" />

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

		<hr class="double hairline" />


		{% for item in hits %}
			<article>
				<h4><a href="{{ item.url|url }}">{{ item.title }}</a></h4>
				<div class="smaller"><em>({{ item.created|timeSince }})</em></div>

				{% if item.type == 'media' and item.misc.urlThumbnail %}
					<img src="{{ item.misc.urlThumbnail }}" style="float:left;padding: 5px 5px 5px 0;" />
				{% endif %}
				<p>{{ item.description }}</p>
				<div class="smaller"><a href="{{ item.url }}">{{ item.url }}</a></div>
			</article>
			<hr class="double hairline" />
		{% endfor %}

		<hr class="spacer" />

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

	</div>

	{% include 'gryphon/main/sidebar-standard.tpl' %}

	<hr class="spacer" />
</div>

{% endblock %}

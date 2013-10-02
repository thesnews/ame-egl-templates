{# pre1/main/main.tpl #}

{% block title %} :: Classifieds{% endblock %}
{% block subActive %}Classifieds{% endblock %}

{% extends "gryphon/base.tpl" %}

{% block content %}

	<div class="row">
	<div class="span8">
		<h1>Classifieds</h1>

		<hr class="hairline"/>
	 <div class="row-fluid">
	 	<div class="span12">

				<div class="sectionalheading">
					<form id="classifieds-search-form" method="post" action="{{ 'pre1:main/search'|url }}">
						<input type="text" id="classifieds-search-terms" name="token" placeholder="Search Classifieds" />
						<select id="classifieds-search-category" name="category">
						<option value="null">All categories</option>
						{% for category in categories %}
							<option value="{{ category.uid }}">{{ category.name }}</option>
						{% endfor %}
						</select>
					</form>
				</div>
		</div>
	</div>

	<div class="row-fluid">
	 	<div class="span12">

			<div class="span4">
				<h3>Categories:</h3>
				   <ul>
				     {% for category in categories %}
					    <li><a href="{{ category.url }}">{{ category.name }}</a></li>
				     {% endfor %}
				   </ul>

				 <div class="well">
					<strong><a href="{{ 'tsn:mail/classified/4'|url }}">Submit a classified ad request</a></strong>
				 </div>
			</div>

			<div class="span8 classified-container">
				{% if featured.length %}
					<h3>Featured:</h3>
					<ul class="unstyled">
					{% for item in featured %}
						<li class="smaller"><a href="{{ item.category.url }}">{{ item.category.name }}</a>:
							 {{ item.copy }}
							<hr class="spacer"/>
						</li>
					{% endfor %}
					</ul>
				{% elseif category.uid %}
					<h3>{{ category.name }}</h3>
					<ul class="unstyled">
					{% for item in category.ads %}
						<li class="smaller">
							 {{ item.copy }}
							<hr class="spacer"/>
						</li>
					{% endfor %}
					</ul>
				{% elseif token %}
					<h3>Search results for "{{ token }}"</h3>
					<ul class="unstyled">
					{% for item in results %}
						<li class="smaller"><a href="{{ item.category.url }}">{{ item.category.name }}</a>:
							 {{ item.copy }}
							<hr class="spacer"/>
						</li>
					{% endfor %}
					</ul>
				{% endif %}

			</div>


			</div>
	    </div>
	</div>

	{% include 'gryphon/main/sidebar-standard.tpl' %}

</div><!-- end of row -->
{% endblock content %}

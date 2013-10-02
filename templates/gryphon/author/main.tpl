{# gryphon/author/main.tpl #}

{% extends "gryphon/base.tpl" %}
{% block title %} :: Staff - {{ author.name }}{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">
	
		<h1>{{ author.name }}</h1>
		
		{{ author.tagline }}
		
		<hr class="spacer" />
		
    {% if author.articles.length %}
    	<h3>Recent articles:</h3>
				<ul>
				  {% for item in author.articles %}
						<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
  				{% endfor %}
				</ul>
		  <hr class="spacer" />
		{% endif %}

    {% if author.blogPosts.length %}
			<h3>Recent posts:</h3>
				<ul>
		  		{% for item in author.blogPosts %}
		    		<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
		      {% endfor %}
    		</ul>
		  <hr class="spacer" />
		{% endif %}

  	{% if author.media.length %}
  		<h3>Recent media:</h3>
    		<ul>
  				{% for item in author.media %}
						<li><a href="{{ item.urlDefault }}">{{ item.title }}</a></li>
					{% endfor %}
				</ul>
      <hr class="spacer" />
		{% endif %}

		
	
	</div>

	{% include 'gryphon/main/sidebar-standard.tpl' %}
	
</div>

{% endblock content %}

{# gryphon/page/main.tpl #}
{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}

{% block content %}


<div class="row">
	<div class="span8">

		<div class="row-fluid">	
			<div class="span12">
				<div class="row-fluid">
				
					<div class="span12">			
						<h1>{{ page.title }}</h1>
						
						<hr class="hairline" /> 
					</div>
				</div>
				{% if page.sidebar %}
				<div class="row-fluid">	
					<div class="span8">				
						<hr class="spacer" />
						{{ page.content_formatted }}
					</div>
					<div class="span4">
						{{ page.sidebar_formatted }}
					</div>
					
				</div>
				{% else %}
				<div class="row-fluid">	
					<div class="span12">				
						<hr class="spacer" />
						{{ page.content_formatted }}
					</div>
				</div>
				{% endif %}
			</div>
		</div>
	</div>
	
	

		{% include 'gryphon/main/sidebar-standard.tpl' %}

</div> <!-- end of row -->

{% endblock content %}

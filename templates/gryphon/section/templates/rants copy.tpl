{# gryphon/section/templates/rants.tpl #}
{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}rants{% endblock %}
{% block bodyClass %}section{% endblock %}

{% block content %}


{% import "macros/article.tpl" as articleRender %}

<div class="row">
	<div class="span8">
	
		<article>
			    <br/>
				<h1>Eagle Rants</h1>
				<!-- <h4> Optional Tagline </h4> -->

				{% macro countlink(item) %}
				<a href="{{ item.url }}#disqus_thread" data-disqus-identifier="{{ item.uuid }}">{{ item.name }}</a>
				{% endmacro %}

				<hr class="spacer" />
				<hr class="hairline clearfix" />
	
		</article>
		
		<hr class = "spacer"/>
			
			<div class="row-fluid">
				<div class="span12">
					<div>
						{{ disqus.list(comment) }}
					</div>

					<hr class="double spacer" />

					<div class="related-stories">
						<div class="row-fluid">
							<div class="span12">
								<h5>What do you have to Rant?</h5>
								<div class="arrow-down"></div>
								<hr class="hairline clearfix" />
							</div>
						</div>
					</div>
				</div>
	 		 </div>

				</div> <!--end span8-->
		{% include "gryphon/main/sidebar-standard.tpl" %}
</div> <!--end row-->


<hr class="spacer" />

{% endblock content %}

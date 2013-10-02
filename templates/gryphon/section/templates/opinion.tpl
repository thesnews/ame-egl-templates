{# gryphon/section/templates/opinion.tpl #}
{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
{% block active %}opinion{% endblock %}
{% block bodyClass %}section{% endblock %}
{% block content %}

{% fetch centerpiece from article with [
	'order': 'weight desc, created desc',
	'limit': '1',
	'where': 'status = 1',
	'withTags': ['opinion', 'photo']
] %}
{% set topStory = articles.shift(1) %}
{% set secondary = articles.shift(2) %}

{% import "macros/article.tpl" as articleRender %}

<div class="row">
	<div class="span8">
		<div class="row-fluid">
			<div class="span12 rundown">
			
				
				
								
				<div class="row-fluid">	
					<div class="span6">
						{{ articleRender.topStory(centerpiece[0]) }}
						<hr class="double spacer" />
					</div>
				
					<div class="span6">
						{% set secondary = articles.shift(2) %}
						{% for article in secondary %}
							{{ articleRender.rundown(article) }}
							<hr class="double spacer" />
						{% endfor %}
					</div>
				</div>
			</div>							
		</div>
					
					
		<hr class="double spacer" />

	<div class="row-fluid">
  		<div class="span12 rundown">
          <header><h2><a><em>Op/Ed:</em></a></h2></header>
          <hr class="half spacer"/>

        		{% fetch editorials from article with [
        			'where': 'status = 1',
        			'order': 'weight desc, created desc',
        			'limit': 3,
        			'withTags': ['editorial']
        		] %}

        		{% for article in editorials %}
        			{{ articleRender.rundown(article) }}
        		{% endfor %}
        </div><!-- end of span7 articles -->
 	</div>

 
	<div class="row-fluid">
		<div class="span12">
			{% include 'gryphon/multimedia/slider.tpl' with ['tags': ['opinion', 'carousel']] %}
		</div>
	</div>
 
 	<hr class="spacer">
 	<div class="row-fluid">
 		{% fetch articles from article with [
            	'where': 'status = 1',
            	'order': 'weight desc, created desc',
            	'limit': 3,
            	'withTags': ['Columns']
          ] %}

   		<div class="span6 rundown">
          	<header><h2><a><em>Columns:</em></a></h2></header>
          		 <hr class="half spacer"/>
            		
            		{% for article in articles %}
            			{{ articleRender.rundown(article) }}
            			<hr class="spacer"/>
            		{% endfor %}
          </div><!-- end of span6 Columns -->

		{% fetch articles from article with [
        		'where': 'status = 1',
              	'order': 'weight desc, created desc',
              	'limit': 3,
              	'withTags': ['Letters']
        ] %}

       	<div class="span6 rundown">
           	<header><h2><a><em>Letters:</em></a></h2></header>
            	<hr class="half spacer"/>
              		{% for article in articles %}
              			{{ articleRender.rundown(article) }}
              			<hr class="spacer"/>
              		{% endfor %}	
              </div><!-- end of span6 Letters -->
      </div><!-- end of rowfluid -->

		<hr class="double spacer" />
	</div> <!--end span8-->
		{% include "gryphon/main/sidebar-standard.tpl" %}
</div> <!--end row-->
{% include "gryphon/main/eaglestories.tpl" %}

<hr class="spacer" />

{% endblock content %}
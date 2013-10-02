<!-- gryphon/section/templates/attic/city.tpl -->

{% extends "gryphon/base.tpl" %}

{% block title %}City{% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}City{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}

<div class="row">
  <div class="span8">
    <div class="row-fluid">
      <div class="span5">
        <h5 class="bordered">CITY:</h5>
      		{% for article in featuredStories %}
      			{{ articleRender.standard(article) }}
      		{% endfor %}
      </div><!-- end of City short span5 -->
      
      <!-- <div class="span7">
        {{ articleRender.topStory(topStory) }}
      </div><!-- end of featured span7 -->
      
    </div><!-- end of row-fluid -->
    
    <div class="row-fluid">
      <div class="span6">
        <h5 class="bordered">MORE CITY:</h5>	
          <ul>
    				{% for article in articles %}
    					<li><h4><a href="{{ article.url }}">{{ article.headline }}</a></h4> </li>
    				{% endfor %}
    			</ul>
          		<div class="span6">
          			<ul>
          			{% for item in items.shift((items.length)/2) %}
          				<li>
          					<h4><a href="{{ item.url }}">{{ item.title }}</a></h4><br />
          					<span class="small">{{ item.byline }}</span>
          					
          					<p>{{ item.abstract }}</p>
          				</li>
          			{% endfor %}
          			</ul>

      </div>
    </div><!-- end of more article row fluid -->
  
  </div><!-- end of main container span8 -->

  
  {% include "gryphon/main/sidebar-standard.tpl" %}
  </div>

</div><!-- end of main row -->


{% endblock content %}
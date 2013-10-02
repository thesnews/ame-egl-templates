{# gryphon/blog/landing.tpl #}

{% extends "gryphon/base.tpl" %}


{% block title %} :: Blogs{% endblock %}
{% block active %}blog{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">
		<h1>State News Blogs</h1>
		<hr class="hairline" />
		<p class="copy">
			State News Blog posts are the opinion of the author. The State News Editorial Board is not responsible for the content contained herein.</p>

		<hr class="spacer" />


		{% fetch blogs from blog with [
				'where': 'status = 1',
				'order': 'self:modified desc'
				]
		%}
		{% for blog in blogs %}
			{% if blog.media.length %}
				<div style="text-align: center;">
				<a style="float:right;" href="{{ blog.url }}.xml"><img style="width:20px;" src="{{ 'assets/dist/img/RSS_Feed_Icon.png'| asset }}" alt = "RSS Feed Logo" /></a>
  					<a href="{{ blog.url }}" style="border:0;"><img src="{{ blog.media[0].url }}" style="border:0;"/></a>
<!--   				  <a href="{{ blog.url }}.xml"><img style="width:20px;" src="{{ 'assets/dist/img/RSS_Feed_Icon.png'| asset }}" alt = "RSS Feed Logo" /></a> -->
				</div>
			{% else %}
				<h2><a style="float:right;" href="{{ blog.url }}">{{ blog.name }}</a>:</h2>
<!-- 				<a href="{{ blog.url }}.xml"><img style="width:20px;" src="{{ 'assets/dist/img/RSS_Feed_Icon.png'| asset }}" alt = "RSS Feed Logo" /></a> -->
			{% endif %}

			<hr class="spacer" />

			{% set post = blog.mostRecent %}
			<article>
				<h3><a href="{{ post.url }}">{{ post.headline }}</a></h3>

				<hr class="half spacer" />

				<p>
					{{ post.abstract_formatted }}
				</p>
				<div class="highlight smaller">
					By {{ post.authors.splat('name')|join(', ') }}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Last updated: {{ blog.modified|timeSince }}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="{{ post.url }}">Read more &#187;</a>
<!-- 					<a style="float:right;" href="{{ blog.url }}.xml"><img style="width:20px;" src="{{ 'assets/dist/img/RSS_Feed_Icon.png'| asset }}" alt = "RSS Feed Logo" /></a> -->
				</div>
			</article>
			<hr class="clearfix double hairline" />

		{% endfor %}

	</div><!-- end of span8 content -->

	{% include 'gryphon/main/sidebar-standard.tpl' %}
  </div><!-- end of span4 sidebar -->
</div><!-- end of row -->

{% endblock %}
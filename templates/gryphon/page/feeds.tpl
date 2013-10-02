{# gryphon/page/feeds.tpl #}
{% extends "gryphon/base.tpl" %}
{% block title %}:: Feeds{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}{% endblock %}

{% block content %}
<div class="row"><!-- main row -->
<div class="span8"><!-- feed content -->
<h1>Feeds, Syndication and Widgets</h1>

<hr class="hairline" />

<hr class="spacer" />

    <h2>RSS/Atom Feeds</h2>
	<hr class="spacer" />
    <p class="smaller">RSS and Atom feeds allow you to add State News content to your favorite feed reader, like <a href="http://reader.google.com">Google Reader</a> or add us to your <a href="http://facebook.com">Facebook</a> news feed.</p>

	<hr class="spacer" />
      <ul class="unstyled">
			    <li><a href="{{ 'gryphon:recent/article.xml'|url }}">Recent Articles and Blogs</a></li>
			    <li><hr class="spacer" /></li>
			</li>
		<hr class="spacer" />
			<li><h3>Sections:</h3>
				 <ul class="unstyled">
					<li><a href="{{ 'gryphon:section/pageOne.xml'|url }}">Top Stories</a></li>
					<li><a href="{{ 'gryphon:section/news.xml'|url }}">News</a>
						<ul>
							<li><a href="{{ 'gryphon:section/city.xml'|url }}">City</a></li>
							<li><a href="{{ 'gryphon:section/campus.xml'|url }}">Campus</a></li>
						</ul>
					</li>
					<li><a href="{{ 'gryphon:section/sports.xml'|url }}">Sports</a></li>
					<li><a href="{{ 'gryphon:section/opinion.xml'|url }}">Opinion</a>
						<ul>
							<li><a href="{{ 'gryphon:section/editorials.xml'|url }}">Editorials</a></li>
							<li><a href="{{ 'gryphon:section/columns.xml'|url }}">Columns</a></li>
							<li><a href="{{ 'gryphon:section/letters.xml'|url }}">Letters</a></li>
						</ul>
					</li>
					<li><a href="{{ 'gryphon:section/features.xml'|url }}">Features</a></li>
				</ul>
			</li>
		</ul>

</div><!-- end of span8 feed content -->

<div class="span4"><!-- sidebar -->
{% include 'gryphon/main/sidebar-standard.tpl' %}
</div><!-- end of sidebar -->
</div><!-- end of main row -->

{% endblock %}

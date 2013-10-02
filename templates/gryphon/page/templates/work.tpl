{# gryphon/page/templates/work.tpl #}
{% extends "gryphon/base.tpl" %}
{% block title %} :: Work at The State News{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">

		<h1>Work at The State News</h1>

		<hr class="hairline" />

		<div class="row-fluid">
			<div class="span8">
				<article>
					<p>The State News serves more than 60,000 readers every day with information through the newspaper and statenews.com. Here's a look behind the scenes at how several hundred students work together each day to publish The State News for the MSU community.</p>

					<h3>Current Openings</h3>

					<hr class="spacer" />

					{{ page.content_formatted }}

					<hr class="spacer" />

					<h3>Who we are</h3>

					<hr class="spacer" />

					<p>The State News is brought to you through the hard work of six departments:</p>

					<h4>Advertising</h4>
					<p>Advertising is responsible for generating $2 million annually for The State News. We're always looking for outgoing people who are self-motivated and have a strong desire to work.</p>

					<h4>Business Office</h4>
					<p>The business office provides support to all the other departments. We're also responsible for all financial matters relating to the newspaper.</p>

					<h4>Creative Services</h4>
					<p>Creative Services is vital to the creation and structure of both the daily edition and statenews.com. Without this department the paper would never make it to circulation every day.</p>

					<h4>Distribution</h4>
					<p>The distribution team is responsible for delivering The State News to MSU and the surrounding area.</p>

					<h4>Editorial</h4>
					<p>At its core, The State News is about just that - news. Reporters, Designers, Editors, Photographers and Interns work together to bring relevant and objective information to the MSU community.</p>

					<h4>Web &amp; Product Development</h4>
					<p>Product Development is responsible for the software infrastructure that runs The State News, statenews.com, and over a dozen other collegiate newspapers around the nation.</p>

				</article>
			</div>
			<div class="span4">
				<article>
					<h3>Requirements</h3>

					<hr class="spacer" />

					<p>To work at The State News, you must be a currently enrolled MSU student, and you must be available to work at least one full semester (three for the Creative Services and Web departments).</p>

					<p>In general, you must provide a resume in Microsoft Word, RTF, or Adobe PDF format, a physical or online portfolio, and an MSU class schedule to be considered for employment (requirements may vary by department).</p>

					<p>You may <a href="{{ 'gryphon:page/contact'|url }}">contact</a> The State News if you have any questions regarding employment.</p>

					<h3>Conflict of Interest Policy</h3>

					<hr class="spacer" />

					<p><a href="{{ 'gryphon:page/coi'|url }}">Important information regarding our Conflict of Interest Policy.</a></p>

					<h3 class="sectionalheading">Applications</h3>

					<ul id="app_pdfs">
						<li><a href="http://statenews.com/docs/applications/app_ad_exec.pdf">Advertising</a></li>
						<li><a href="http://statenews.com/docs/applications/app_reception.pdf">Business Office</a></li>
						<li><a href="http://statenews.com/docs/applications/app_production.pdf">Creative Services</a></li>
						<li><a href="http://statenews.com/docs/applications/app_distrib.pdf">Distribution</a></li>
						<li><a href="http://statenews.com/docs/applications/app_editorial.pdf">Editorial</a></li>
						<li><a href="http://statenews.com/docs/applications/photo_app.pdf">Photo</a></li>
						<li><a href="http://statenews.com/docs/applications/app_production.pdf">Web & Product Development</a></li>
					</ul>
				</article>
			</div>
		</div>
	</div>
	{% include 'gryphon/main/sidebar-standard.tpl' %}

</div>
<hr class="spacer" />

{% endblock %}

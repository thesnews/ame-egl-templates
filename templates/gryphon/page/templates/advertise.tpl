{# gryphon/page/main.tpl #}
{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}

{% block content %}


{% set pdfs = page.media.grab('type', 'pdf', true) %}

<div class="row">
	<div class="span8">

		<div data-configid="1384031/1654057" style="width: 525px; height: 265px;" class="issuuembed"></div><script type="text/javascript" src="//e.issuu.com/embed.js" async="true"></script>

        <hr class="double spacer" />

        {% if pdfs.length %}
            <div class="well pull-left" style="margin:0 10px 10px 0;">
                <h4>Downloads &amp; Documents</h4>

                <ul>
                    {% for pdf in pdfs %}
                        <li><a href="{{pdf.urlOriginal}}">{{pdf.title}}</a></li>
                    {% endfor %}
                </ul>
            </div>
        {% endif %}

		<p>If you are interested in advertising with The Eagle, or have any questions about our rate and publication information, please contact us at either  202-885-3593 or <a href="mailto:business@theeagleonline.com">business@theeagleonline.com</a> or <a href="mailto:adbox@theeagleonline.com">adbox@theeagleonline.com</a>.
		<iframe src="https://docs.google.com/forms/d/1dEluLctvnyFZ0i8igBCFddddx8G7YfLDfUgsmLNqHFo/viewform?embedded=true" width="600" height="1200" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>
		<div class="adside" style="float: right; margin-top:0px;">
		</div>

        {{page.content_formatted}}

	</div>



		{% include 'gryphon/main/sidebar-standard.tpl' %}

</div> <!-- end of row -->

{% endblock content %}

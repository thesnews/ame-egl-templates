{# roost/roost/tos.tpl #}

{% extends 'gryphon/base.tpl' %}

{% block title %} :: Housing Guide Terms of Service{% endblock %}
{% block active %}{% endblock %}
{% block subActive %}Housing Guide{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ 'roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}
	{% helper adpilotHelper as ads %}
	<div class="grid_8">
		<div id="housing_finder_header">
			<a href="{{ 'roost:roost'|url }}"><img src="{{ 'roost/frontend/style/images/housing-header.gif'|url }}" alt="SN Housing Guide" style="border:0;" border="0" /></a>
			<div id="housing_sponsor"><!--/* OpenX iFrame Tag v2.8.7 */-->
<!--/* OpenX iFrame Tag v2.8.7 */-->

<iframe id='a306b122' name='a306b122' src='http://adserver.thesne.ws/openx/www/delivery/afr.php?n=a306b122&amp;zoneid=11&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;ct0=INSERT_CLICKURL_HERE' frameborder='0' scrolling='no' width='150' height='40' allowtransparency='true'><a href='http://adserver.thesne.ws/openx/www/delivery/ck.php?n=ac04cdc1&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://adserver.thesne.ws/openx/www/delivery/avw.php?zoneid=11&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=ac04cdc1&amp;ct0=INSERT_CLICKURL_HERE' border='0' alt='' /></a></iframe>
<script type='text/javascript' src='http://adserver.thesne.ws/openx/www/delivery/ag.php'></script>
			</div>
		</div>



		<h1>Terms of Service: Housing Guide</h1>

		<strong>Last Update:</strong> February 2, 2010.
		<p>
			Property listings and associated files are provided and maintained by the individual property owners listed. The State News takes no responsibility for the content thereof. Users are solely responsible for reviewing and making decisions and agreements or contracts based on the information provided in this Online Housing Guide and agrees to hold The State News harmless and waives any liability of The State News for any or all disputes involving information provided in this guide.
		</p>

		<p>
			 Although most changes are likely to be minor, The State News may change its Housing Guide Terms of Service from time to time, and in The State News's sole discretion. The State News encourages visitors to frequently check this page for any changes to its Housing Guide Terms of Service. Your continued use of this site after any change in this Terms of Service policy will constitute your acceptance of such change.
		</p>
	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-standard.tpl' %}
	</div>
	<hr class="spacer" />
{% endblock content %}
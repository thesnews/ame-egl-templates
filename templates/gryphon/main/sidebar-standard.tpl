<!-- gryphon/main/sidebar-standard.tpl -->

{% helper request %}
<div class="span4 hidden-phone hidden-tablet">
	<div class="sidebar-wrap">

		{% include 'gryphon/ads/rectangle.tpl' %}

		{#<hr class="spacer" />

		{% include 'gryphon/main/disqus-box.tpl' %}#}

        <hr class="spacer" />
	</div>

		<div class="row-fluid">

    			<div class="sidebar-wrap">
    			<div class="pull-left">
    				<a href="https://www.facebook.com/theaueagle" target="_blank"><img src="{{ 'assets/dist/img/fb_large.png' | asset }}" alt="Facebook" /></a></div>
    		  	</div>




  				<div class="sidebar-wrap">
  					<a href="https://twitter.com/TheEagleOnline" target="_blank">
  						<div class="pull-right">
  							<img src="{{ 'assets/dist/img/twt_large.png' | asset }}" alt="Twitter" /></a>
  						</div>

  			</div>
		</div>


	<div class="sidebar-wrap">

		<hr class="spacer" />

		{% include 'tsn/poll/recent.tpl' %}

		<hr class="spacer" />

		{#{% include "pre1/featured.tpl" %}#}

	</div>

</div>

{# gryphon/base.tpl #}

{% import "macros/render.tpl" as render %}
{% import "macros/disqus.tpl" as disqus %}
{% helper config %}
{% helper weather %}
{% helper issuuDoc %}
{% helper request %}

{% set title %}{% block title %}{% endblock %}{% endset %}

{% if not active %}
	{% set active %}{% block active %}{% endblock %}{% endset %}
{% endif %}

{% set subActive %}{% block subActive %}{% endblock %}{% endset %}

{% set description %}{% block description %}{% endblock %}{% endset %}

{% set bodyClass %}{% block bodyClass %}{% endblock %}{% endset %}

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<meta name="generator" content="Gryphon {{ config.appVersion }} (Foundry {{ config.foundryVersion }})" />

		<meta name="viewport" content="width=device-width">

		<meta name="google-site-verification" content="pUNkh9fQRUX_qOesZxatbobuWgkhz_z-XGZrN9o27mo" />

		<meta name="title" content= "The Eagle" />
		<meta name="description" content= "{{ description|default("American's Voice") }}" />

		<link href='http://fonts.googleapis.com/css?family=Ubuntu:300' rel='stylesheet' type='text/css'>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
		<script src="{{ 'assets/dist/js/master-min.js' |asset}}"></script>
		<script type="text/javascript" src="{{ 'assets/dist/js/modernizr-2.6.2.min.js'|asset }}"></script>
		<link rel="apple-touch-icon-precomposed" href="{{'assets/dist/img/egl-mobile-icon.png'|asset}}"/>


		{% if noIndex %}
			<meta name="robots" content="noindex, nofollow" />
		{% endif %}

		<title>The Eagle</title>

		{% block styles %}{% endblock %}
		{% block links %}{% endblock %}

		<link rel="icon" type="image/png" href="{{ 'assets/dist/img/EAG_favicon-01.png'|asset }}" />
		<link rel="stylesheet" type="text/css" media="screen, projection, print" href="{{ 'assets/dist/css/master.css'|asset }}" />
		<link rel="alternate" type="application/rss+xml" title="Top Stories" href="http://statenews.com/dart/feed/state-news-top-stories.xml" />

		<link rel="stylesheet" type="text/css" media="screen" href="{{ 'assets/dist/css/add2home.css'|asset }}">
		<script type="text/javascript">
			var addToHomeConfig = {
			returningVisitor: true,
			expire:120,
			message:'To add <em>The Eagle</em> on your %device, tap the %icon and then <strong>Add to Home Screen.</strong>'
			};
		</script>
		<script type="application/javascript" src="{{ 'assets/dist/js/add2home.js'|asset }}"></script>
		<script type="application/javascript" src="{{ 'assets/src/js/dropnav.js'|asset }}"

		<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'assets/dist/css/jquery.fancybox.css'|asset }}" />
		<link rel="stylesheet" type="text/css" media="print" href="{{ 'assets/dist/css/print.css'|asset }}" />

		<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">
		<script src="http://vjs.zencdn.net/c/video.js"></script>


		<!-- <script type="text/javascript">

		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-1362565-1']);
		  _gaq.push(['_trackPageview']);

		  (function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);
		  })();

		</script> -->

		<script>
			  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

			  ga('create', 'UA-43640500-1', 'theeagleonline.com');
			  ga('send', 'pageview');

		</script>

		<!--[if lte IE 8]>
			<link rel="stylesheet" type="text/css" media="screen, projection" href="{{ 'assets/dist/css/ie8.css'|asset }}" />
		<![endif]-->

        <script type='text/javascript'>
        var googletag = googletag || {};
        googletag.cmd = googletag.cmd || [];
        (function() {
        var gads = document.createElement('script');
        gads.async = true;
        gads.type = 'text/javascript';
        var useSSL = 'https:' == document.location.protocol;
        gads.src = (useSSL ? 'https:' : 'http:') +
        '//www.googletagservices.com/tag/js/gpt.js';
        var node = document.getElementsByTagName('script')[0];
        node.parentNode.insertBefore(gads, node);
        })();
        </script>

        <script type='text/javascript'>
			googletag.cmd.push(function() {
			googletag.defineSlot('/285426675/TSN_Button_Rail_Left_120x90', [[120,90], [125, 125]],'div-gpt-ad-1363892386995-0').addService(googletag.pubads());
			googletag.defineSlot('/285426675/TSN_Button_Rail_Right_120x90', [[120,90], [125, 125]],'div-gpt-ad-1363892386995-1').addService(googletag.pubads());
			googletag.defineSlot('/285426675/TSN_Button_Top_Left_120x90', [120, 90],	'div-gpt-ad-1363892386995-2').addService(googletag.pubads());
			googletag.defineSlot('/285426675/TSN_Button_Top_Right_120x90', [120,90], 'div-gpt-ad-1363892386995-3').addService(googletag.pubads());
			googletag.defineSlot('/285426675/TSN_HalfBanner_ClassSponsor_234x60',[234, 60], 'div-gpt-ad-1363892386995-5').addService(googletag.pubads());
			googletag.defineSlot('/285426675/TSN_Leaderboard_Top_728x90', [728, 90],'div-gpt-ad-1363892386995-6').addService(googletag.pubads());
			googletag.defineSlot('/285426675/TSN_Rectangle_Rail_300x250', [300,250], 'div-gpt-ad-1363892386995-7').addService(googletag.pubads());
			googletag.defineSlot('/285426675/TSN_HalfBanner_Mobile_234x60', [234, 60], 'div-gpt-ad-1364316435482-0').addService(googletag.pubads()); googletag.enableServices();
			googletag.pubads().enableSingleRequest();
			googletag.enableServices();
			});
        </script>

		{% block scripts %}{% endblock %}

       <meta name = "twitter:site" content="@theEagleOnline"/>

		{% if request.getSegment(0) == 'article' %}
			<meta name = "twitter:card" content="summary"/>
			<meta property="og:image" content="{{ 'assets/dist/img/fb-hidden-icon.jpg'|asset }} "/>
			<meta property = "og:title" content = "{{ article.headline }}"/>
			<meta property = "og:type" content="article"/>
			<meta property = "og:url" content = "{{ article.url }}"/>
			<meta property = "og:description" content = "{{ article.abstract_formatted|striptags }}"/>
			{% if article.media.grab('type', 'image').length %}
				<meta property = "og:image" content = "{{ article.media.grab('type', 'image')[0].url }}">
				<meta property = "og:image" content = "{{ 'assets/dist/img/fb-hidden-icon.jpg'|asset }} "/>
			{% endif %}

			{% if article.created|date('Ymd') <= '-2 years'|date('Ymd') %}
				<meta name="robots" content="noindex, nofollow">
			{% endif %}

		{% elseif request.getSegment(0) == 'gallery' %}
			<meta name="twitter:card" content="gallery">
			<meta name="twitter:title" content="{{ gallery.title }}">
			<meta name="twitter:description" content="{{ gallery.description_formatted }}">
			{% for image in gallery.mediaOrdered %}
				{% if loop.index0 < 4 %}
					<meta name="twitter:image{{loop.index0}}:src" content="{{ image.url }}">
				{% endif %}
			{% endfor %}

		{% elseif request.getSegment(0) == 'multimedia' %}
			{% set topMedia = false %}
			{% if request.getSegment(1) %}
				{% set topMedia = media[0] %}
			{% endif %}
			{% if topMedia.type == "video" %}
				<!-- for the videos   -->
				<meta name="twitter:card" content="player">
				<meta name="twitter:title" content="{{ topMedia.title }}">
				<meta name="twitter:description" content="{{ topMedia.caption_formatted }}">
				<meta name="twitter:player" content="{{ topMedia.urlDefault }}">
				<meta name="twitter:player:url" content=" {{ topMedia.url }}">
				<meta name="twitter:player:height" content="435">
				<meta name="twitter:player:width" content="775">
				<meta name="twitter:domain" content="theeagleonline.com">

				<meta name="twitter:app:name:iphone" content="">
				<meta name="twitter:app:name:ipad" content="">
				<meta name="twitter:player:stream:content_type" content="">

			{% elseif topMedia.type == "image" %}
				<!-- for the images -->
				<meta name="twitter:card" content="photo">
				{#<meta name="twitter:url" content="{{ topMedia.url }}">#}
				<meta name="twitter:title" content="{{ topMedia.title }}">
				<meta name="twitter:description" content="{{ topMedia.caption_formatted }}">
				<meta name="twitter:image" content="{{ topMedia.url }}">
			{% endif %}

		{% else %}
		   <meta property="og:title" content="The Eagle"/>
		   <meta property="og:type" content="website"/>
		   <meta property="og:description" content="American's Newspaper"/>
		   <meta property = "og:image" content = "{{ 'assets/dist/img/E-icon.png'|asset }} "/>

		{% endif %}

	</head>

	<body{% if bodyClass %} class="{{ bodyClass }}"{% endif %} >
	{% include 'gryphon/main/supernav.tpl' %}
		<hr class="half spacer" />

		<div id="fb-root"></div>
		<script>(function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
			  if (d.getElementById(id)) return;
			  js = d.createElement(s); js.id = id;
			  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=122067054530307";
			  fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		</script>

			<hr class="double spacer" />
			<hr class="double spacer" />
			<hr class="double spacer hidden-phone" />

			<div class="container">
		        <div class="row-fluid">
		            <div class="span12 hidden-phone text-center">
			            <!-- gryphon/ads/leaderboard.tpl -->
	             		<div class="ad leaderboard"></div>
	              		<span class="hidden-tablet" style="margin-left:20px;">
	              		    <!-- gryphon/ads/button.tpl -->
	                    	<div class="ad button">  </div>
		                </span>
		           </div>
	            <hr class="spacer" />
		        </div>
		    </div>

		<hr class="double spacer hidden-phone" />

		<div class="container" id="maincontain"> <!-- Begin of Bootstrap-->


			<header>
				<div class="row hidden-phone" id="top-ticker">

					<div class="span8 text-left hidden-phone">

						<ul class="unstyled">
						  <li><a href="{{ 'page/about'|url }}">about</a></li>
						  <li><a href="{{ 'page/contact'|url }}">contact</a></li>
						  <li><a href="{{ 'page/jobs'|url }}">jobs</a></li>
						  <li><a href="{{ 'page/advertising'|url }}">advertising</a></li>
						  <li><a href="{{ 'page/archives'|url }}">archives</a></li>
						</ul>
					</div>


					<div class=" text-right">
						<ul class="hidden-phone social_icons" >
							<li ><a href="http://www.facebook.com/theaueagle"><img src="{{ 'assets/dist/img/facebook_logo.png'|asset }}" alt="Facebook Logo"/></a></li>
							<li ><a href="http://twitter.com/theeagleonline"><img src="{{ 'assets/dist/img/twitter-logo.png'|asset }}" alt="Twitter Logo"/></a></li>
							<li ><a href="http://YOUTUBE.COM"><img src="{{ 'assets/dist/img/youtube_logo.png'|asset }}" alt="Youtube Logo"/></a></li>
							<li ><a href="{{ 'page/feeds'|url }}"><img src="{{ 'assets/dist/img/RSS_Feed_Icon.png'|asset }}" alt="RSS Feed Logo"/></a></li>
							<!--<li ><a href="http://twitter.com/theeagleonline"><img src="{{ 'assets/dist/img/email_icon.png'|asset }}" alt="Email Icon"/></a></li>-->
						</ul>
					</div>



					<div class="pull-right">
						<form  id="search" method="get" action="{{ 'search'|url }}">
							{#<div class="ad search-sponsor hidden-phone hidden-tablet">
								&nbsp;
							</div>#}
							<input style=" border-radius:10px; color: #444" id="searchField" type="text" name="q" placeholder="Search" class="span2" />
						</form>
					</div>


				</div>

				<div class="row" id="masthead" >
					<div class="span2"><div id="weather" class="hidden-phone" style="padding-bottom:17px;">
						<span>{{ weather }}</span><br />
						<span>{{ weather.temp }}&deg;</span>
						<br/>
						<a href="{{ weather.url }}">7-day forecast</a>
					</div>
				</div>

					{% fetch topA from article with [
						'where': 'status = 1',
						'order': 'created desc',
						'limit': 1
					] %}

					{% fetch topP from blogPost with [
						'where': 'status = 1',
						'order': 'created desc',
						'limit': 1
					] %}

					<div class="span8 text-center">
						<a href="{{ '/'|url }}"><img src="{{ 'assets/dist/img/Eagle_Logo.png'|asset }}" alt="Eagle Logo"/></a>
						<hr class = "spacer"/>
						<h5 class ="tagline">Delivering American University's news and views since 1925.</h5>
						<h3 id="date"><span style="color:#a5a5a5;">|</span> {{ now|date('l, F j, Y') }}
							{#
							{% if topA[0].created > topP[0].created %}

								{% if now|date('md') == topA[0].created|date('md') %} | <span style="{% if active == "multimedia" %} color:#acacac;{% else %} color:#222; {% endif %}">Last updated:</span> <a href="{{ '/recent'|url }}">{{ topA[0].created|date('g:ia') }}</a>{% endif %}

							{% else %}

								{% if now|date('md') == topP[0].created|date('md') %} | <a href="{{ '/recent'|url }}">Last updated: {{ topP[0].created|date('g:ia') }}</a>{% endif %}

							{% endif %}
							#}
						</h3>
						<hr class="double spacer" />
					</div>
				</div>

				<hr class="half spacer" />
			</header>
			<div class="main-nav">
			<div class="navbar center">
				<div class="navbar-inner">
					<a class="brand hidden-desktop" href="#" data-toggle="collapse" data-target=".nav-collapse" style="color:#fff;text-shadow:none;">Navigation</a>
					<a class="btn btn-navbar" data-toggle="collapse" data-target="#main-nav">
						<span class="icon-chevron-down"></span>
					</a>
					<div id="main-nav" class="nav-collapse collapse">
						<ul class="nav">

							<li{% if not active or active == "home" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'top_stories']) }}"><a href="{{ '/'|url }}">Home</a></li>

							<li{% if active == "news" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'news']) }}"><a href="{{ 'section/news'| url }}">News</a></li>


							<li{% if active == "scene" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'scene']) }}"><a href="{{ 'section/scene'| url }}">the Scene</a></li>

							<li{% if active == "opinion" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'opinion']) }}"><a href="{{ 'section/opinion'| url }}">Opinion</a></li>


							<li{% if active == "sports" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'sports']) }}"><a href="{{ 'section/sports'| url }}">Sports</a></li>

							<li{% if active == "multimedia" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'multimedia']) }}"><a href="{{ 'multimedia'| url }}">the Gallery</a></li>

							<li{% if active == "rants" %} class="active"{% endif %} ><a href="{{ 'section/rants'| url }}">Eagle Rants</a></li>
						</ul> <!-- end of nav -->
					</div><!-- end of collapse collapse -->
				</div> <!-- end of nav bar inner-->
			</div> <!-- end of nav bar -->
			</div>
			{% block subnav %}{% endblock %}

			<div class="container" id="main-content">
				{# THIS IS THE MAIN CONTENT BLOCK #}
				{% block content %}{% endblock %}
			</div>

			<hr class="spacer" />

			<footer>
				<div class="container">
				<hr class="spacer clearfix"/>
					<div class="row">
						<div class="span2">


									<ul>
										<li ><a href="{{ '/'|url }}">Home</a></li>
										<li><a href="{{ '/section/news'|url }}">News</a></li>
										<li ><a href="{{ '/section/scene'|url }}">the Scene</a></li>
										<li ><a href="{{ '/section/opinion'|url }}">Opinion</a></li>
										<li ><a href="{{ '/section/sports'|url }}">Sports</a></li>
										<li ><a href="{{ '/multimedia'|url }}">the Gallery</a></li>
										<li ><a href="{{ '/section/rants'|url }}">Eagle Rants</a></li>
									</ul>
						</div>
						<div class="span2">
									<ul id="right">

										<li><a href="{{ '/page/about'|url }}">About</a></li>
										<li><a href="{{ '/page/contact'|url }}">Contact</a></li>
										<li><a href="{{ '/page/jobs'|url }}">Jobs</a></li>
										<li><a href="http://www.austudentmedia.org/page/advertising">Advertise</a></li>
										<li><a href="{{ '/page/archives'|url }}">Archives</a></li>
									</ul>

						</div>

						<div class="span4 text-center hidden-phone">
							<a href="{{ '/'|url }}"><img class="logo" src = "{{ 'assets/dist/img/Eagle_Logo.png' | asset }}" /></a>
						</div>

						<div class="offset2 span2 issuu text-center" id="print">
							<div ><a href="http://issuu.com/garnetandblack" target="_blank">Print Edition</a><br />
								<a href="{{ issuuDoc.recent.link }}" target="_blank"><img src="{{ issuuDoc.recent.thumb_large }}" alt="front page" class="issuu-preview" /></a>
							</div>
						</div>
					</div>
				<hr class="spacer clearfix"/>
					<div class="row">
						<div class="span12 text-center">

							<div id="snworks-bug">
								Powered by <a href="http://getsnworks.com" target="_blank"><img src="{{ 'assets/dist/img/SNworkslogo.png' | asset}}" alt="powered by SNworks" title="powered by SNworks" /></a> Solutions by The State News
							</div><!-- /#snworks-bug -->
						</div><!-- /.span12 .text-center -->

						<div class="span12 text-center" id="copy">
							Copyright &copy; {{ now|date('Y') }}
						</div>

						<div class="span12 text-center">

							<a href="#">Privacy Policy</a>

						</div>



					</div><!-- /.row -->
					<hr class="spacer clearfix"/>
				</div>
			</footer> <!--end of footer-->

		</div> <!-- end of container -->

	</body>
</html>

<!-- gryphon/media/video.tpl -->

<h3 class="vid" >{{ media.title }}</h3>

<video id="tsn_video_{{ media.uid }}" class="video-js vjs-default-skin" controls width="640" height="380" poster="{{ media.urlPreview }}" preload="auto" data-setup="{}">
  <source type="video/mp4" src="{{ media.urlOriginalMp4 }}">
</video>
<hr class="double spacer" />
<div class="media-caption" style="max-width:640px;">
	<aside>{{ media.authors.splat('name')|join(', ') }} / {% if media.credit %}{{ media.credit }}{% endif %}</aside>
	<hr class="half spacer" />
	{{ media.caption_formatted }}
</div>

<ul class="share unstyled" style="margin-top:10px;">
	<li style="display:inline-block;width:100px;"><a class="socialite twitter-share" href="http://twitter.com/share" data-url="{{ media.urlDefault }}">Share on Twitter</a></li>
  <li style="display:inline-block;width:100px;"><a class="socialite googleplus-one" href="https://plusone.google.com" data-href="{{ media.urlDefault }}" data-size="medium">+1</a></li>
	<li style="display:inline-block;width:100px;"><a class="socialite facebook-like" href="http://facebook.com" data-href="{{ media.urlDefault }}" data-send="false" data-layout="button_count" data-width="60" data-show-faces="false">Like on Facebook</a></li>
</ul>

<script type="text/javascript">
    // Once the video is ready
    _V_("tsn_video_{{ media.uid }}").ready(function(){

        var myPlayer = this;  // Store the video object
        var aspectRatio = 9/16; // Make up an aspect ratio

        function resizeVideoJS(){
              // Get the parent element's actual width
              var width = document.getElementById(myPlayer.id).parentElement.offsetWidth;
              myPlayer.width(width).height( width * aspectRatio ); // Set width to fill parent element, Set height
        }

        resizeVideoJS(); // Initialize resizeVideoJS()
        window.onresize = resizeVideoJS; // Call resizeVideoJS() on window.resize();
    });
	Socialite.load();
</script>

<hr class="half spacer">
{% if media.articles.length %}
		<a href="{{ media.articles[0].url }}" class="btn btn-primary pull-left"><i class="icon-list-alt icon-white"></i> Related article</a>
{% endif %}



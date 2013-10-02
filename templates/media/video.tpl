<!--media/video.tpl-->

{% if media.created < 1349049600 %}
	<script type="text/javascript" src="http://cdn.tsn.s3.amazonaws.com/flowplayer/flowplayer-3.2.11.min.js"></script>
	<div style="margin:auto;width:600px;">
        <a
             href="{{ media.urlOriginal }}"
             style="display:block;width:600px;height:360px"
             id="player">
        </a>
	</div>

    <!-- this will install flowplayer inside previous A- tag. -->
    <script>
        flowplayer("player", "http://cdn.tsn.s3.amazonaws.com/flowplayer/flowplayer-3.2.15.swf", {
            clip:  {
                autoPlay: false,
            }
        });
    </script>

{% else %}
<video id="tsn_video_{{ media.uid }}" class="video-js vjs-default-skin" controls
  preload="auto" width="100%" height="auto" poster="{{ media.url }}"
  data-setup="{}">
  <source src="{{ media.urlOriginalMp4 }}" type='video/mp4'>
  <source src="{{ media.urlOriginalWebm }}" type='video/webm"'>
  <source src="{{ media.urlOriginalOgg }}" type='video/ogg; codecs="theora, vorbis"'>
</video>
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
</script>
{% endif %}

<!-- gryphon/main/dsiqus-box.tpl -->

{% helper disqusPopular as popular %}

<div class="accordion" id="popular-box">
	{#<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#popular-box" href="#collapseOne">
				Popular<span class="pull-right"><i class="icon-white icon-minus"></i></span>
			</a>
		</div>
		<div id="collapseOne" class="accordion-body collapse in">
			<div class="accordion-inner smaller">
				<ul>
					{% for item in popular.threads|shift(5) %}
						{% if not 'ame-egl.thesn'|in(item.link) %}
							<li><a href="{{ item.link }}">{{ item.title }}</a></li>
						{% endif %}
					{% endfor %}
				</ul>
			</div>
		</div>
	</div>#}
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#popular-box" href="#collapseTwo">
				Recent Comments<span class="pull-right"><i class="icon-white icon-plus"></i></span>
			</a>
		</div>
		<div id="collapseTwo" class="accordion-body collapse">
			<div class="accordion-inner smaller">
				<ul>
					{% for item in popular.posts|shift(5) %}
						<li>{{ item.author.name }} said: <p class="copy" style="margin:0;padding:0;">{{ item.raw_message|clip(50) }}</p><div class="smaller">on <a href="{{ item.thread.link }}">{{ item.thread.title }}</a></div><hr class="spacer" /></li>
					{% endfor %}
				</ul>
			</div>
		</div>
	</div>
</div>

{# tsn/mail/opinion.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ form.subject }} {% endblock %}
{% block active %}opinion{% endblock %}
{% block subActive %}Opinion{% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">
		<h1>Submit a Letter to the Editor</h1>

		<hr class="hairline" />

		<p class="smaller">
			Feel free to send links to articles or media along with your letter. We do ask that you keep your letters at or under 500 words. Please remember that The State News reserves the right to edit your letter for length and/or clarity. Also, all fields are required.
		</p>

		{% if status == 'error' %}
			<div class="alert alert-error smaller">
				<p>There appears to have been an error sending your message. Please make sure you've filled the form out completely and try again.</p>
			</div>
		{% elseif status == 'success' %}
			<div class="alert alert-success smaller">
				<p>Your message has been sent!</p>
			</div>
		{% endif %}

		<form method="post" action="{{ form.urlSubmitAndReturnTo('section/opinion') }}" class="form-horizontal" enctype="multipart/form-data">
			{# this is required for mail sending to work #}
			<input type="hidden" name="mailkey" value="{{ key }}" />

			<div class="control-group">
				<label class="control-label">Your name:</label>
				<div class="controls">
					<input type="text" name="sender_name" value="{{ message.sender_name }}" class="input-xxlarge" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Your email address:</label>
				<div class="controls">
					<input type="text" name="sender" value="{{ message.sender }}" class="input-xxlarge" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Subject:</label>
				<div class="controls smaller">
					{{ form.subject }}
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Your message:</label>
				<div class="controls">
					<textarea rows="6" cols="40" name="message" class="input-xxlarge">{{ message.message }}</textarea>
				</div>
			</div>

			<hr class="spacer"/>

			{% if form.allow_uploads %}
				<label>You can attach an image to your message. It must be smaller than 2MB.</label>
				<input type="file" name="attached" /><br />

				<hr />
			{% endif %}

			{% if turing %}
				<div class="control-group">
					<div class="controls">
						{{ turing }}
					</div>
				</div>
			{% endif %}

			<div class="control group">
				<div class="controls">
					<input class="btn btn-primary" type="submit" value="Send my message" />
				</div>
			</div>

		</form>
	</div><!-- end of span8 -->

  	{% include "gryphon/main/sidebar-standard.tpl" %}
</div><!-- end of main row -->

{% endblock content %}
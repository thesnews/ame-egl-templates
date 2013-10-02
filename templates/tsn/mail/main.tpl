{# tsn/mail/main.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ form.subject }} {% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">

		<h1>Feedback: {{ form.subject }}</h1>

		<hr class="hairline" />

		{% if status == 'error' %}
			<div class="alert alert-error smaller">
				<p>There appears to have been an error sending your message. Please make sure you've filled the form out completely and try again.</p>
			</div>
		{% elseif status == 'success' %}
			<div class="alert alert-success smaller">
				<p>Your message has been sent!</p>
			</div>
		{% endif %}

		<form method="post" action="{{ form.urlSubmit }}" class="form-horizontal" enctype="multipart/form-data">
			{# this is required for mail sending to work #}
			<input type="hidden" name="mailkey" value="{{ key }}" />

			{% if form.instructions %}
				<p class="smaller">{{ form.instructions }}</p>
			{% endif %}

			<div class="control-group">
				<label class="control-label">Your name:</label>
				<div class="controls">
					<input type="text" name="sender_name" value="{{ message.sender_name }}" class="input-xxlarge" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">To:</label>
				<div class="controls">
					{% if form.receiver %}
						{{ form.receiver }}
					{% else %}
						<input type="text" name="receiver" value="{{ message.receiver }}" class="input-xxlarge" />
					{% endif %}
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">From:</label>
				<div class="controls">
					{% if form.sender %}
						{{ form.sender }}
					{% else %}
						<input type="text" name="sender" value="{{ message.sender }}" class="input-xxlarge" />
					{% endif %}
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Subject:</label>
				<div class="controls">
					{% if form.subject %}
						{{ form.subject }}
					{% else %}
						<input type="text" name="subject" value="{{ message.subject }}" class="input-xxlarge" />
					{% endif %}
				</div>
			</div>


			<div class="control-group">
				<label class="control-label">Your Message:</label>
				<div class="controls">
					<textarea rows="6" cols="40" name="message" class="input-xxlarge">{{ message.message }}</textarea>
				</div>
			</div>

			{% if form.allow_uploads %}
				<div class="control-group">
					<label class="control-label">Your can attach a file to your message</label>
					<div class="controls">
						<input type="file" name="attached" />
					</div>
				</div>
			{% endif %}

			{% if turing %}
				<div class="control-group">
					<div class="controls">
						{{ turing }}
					</div>
				</div>
			{% endif %}

			<div class="control-group">
				<div class="controls">
					<input class="btn btn-primary" type="submit" value="Send my message" />
				</div>
			</div>

		</form>

	</div>


		{% include "gryphon/main/sidebar-standard.tpl" %}

	<hr class="spacer" />
</div>

{% endblock content %}
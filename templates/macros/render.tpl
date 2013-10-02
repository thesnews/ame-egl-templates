
{% macro media(media, type) %}

	{% set file = media.fileType %}

	{% if type %}
		{% set file %}{{file}}_{{type}}{% endset %}
	{% endif %}

	{% if file %}
		{% set pth %}media/{{ file }}.tpl{% endset %}

		{% include pth %}
	{% endif %}


{% endmacro %}

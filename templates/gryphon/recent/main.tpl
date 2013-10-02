{# gryphon/recent/main.tpl #}

{% extends "gryphon/base.tpl" %}

{% block title %} :: Recently{% endblock %}
{% block description %}Recent items from The State News{% endblock %}

{% block content %}
<div class="row">
	<div class="span8">
    	<h1>Recent Content</h1>
	    <hr class="double spacer" />

        {% if articles.length %}
            <ul class="unstyled">
                {% for item in articles %}
                    <li>
                        <div class="clearfix">
                            {% if item.extension %}
                                <a href="{{ item.urlDefault }}"><img src="{{ item.urlPreview }}" style="max-width:100px;padding:0 10px 10px 0;" class="pull-left" /></a>
                            {% endif %}
                            <h3><a href="{% if item.extension %}{{ item.urlDefault }}{% else %}{{ item.url }}{% endif %}">{{ item.getTitle() }}</a></h3>
                            <div class="highlight smaller">
                                Posted {{ item.created|timeSince }}
                            </div>

                            <p class="copy">
                                {{ item.getDescription()|strip }} <a href="{% if item.extension %}{{ item.urlDefault }}{% else %}{{ item.url }}{% endif %}">More &#187;</a>
                            </p>
                        </div>
                        <hr class="hairline" />
                    </li>
                {% endfor %}
            </ul>
        {% else %}
            Sorry, nothing new.
        {% endif %}
    </div>

    <div class="span4">
        {% include 'gryphon/main/sidebar-standard.tpl' %}
    </div>

    <div class="clear"></div>
{% endblock %}
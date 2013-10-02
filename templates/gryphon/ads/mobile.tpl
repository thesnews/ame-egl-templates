<!-- gryphon/ads/mobile.tpl -->

{% helper request %}
{% if request.isSmartPhone() %}
<hr class="hairline" />
<div class="hidden-desktop hidden-tablet text-center">

    {# add code here #}

</div>
<hr class="hairline" />
{% endif %}
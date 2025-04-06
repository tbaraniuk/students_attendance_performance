{% macro strip_percentage(input_string) %}

  {% if input_string[-1] == '%' %}

    {% set result = input_string[0:input_string|length-1]|int %}
  {% else %}

    {% set result = input_string|int %}
  {% endif %}

  {{ return(result) }}

{% endmacro %}

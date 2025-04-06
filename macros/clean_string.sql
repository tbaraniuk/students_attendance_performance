{% macro clean_string(input_string) %}

  {% set cleaned_string = input_string | trim | lower %}

  {{ return(cleaned_string) }}
{% endmacro %}

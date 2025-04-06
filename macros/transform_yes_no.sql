{% macro transform_yes_no(column) %}
    case
        when {{ column }} = '' then 'No'
        when {{ column }} is null then 'No'
        else {{ column }}
    end
{% endmacro %}

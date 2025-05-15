{% macro transform_status(column) %}
    case
        when {{ column }} in ('❌', 'not done') then 'Not Completed'
        when {{ column }} in ('✔', '✅', 'Done') then 'Completed'
        when lower({{ column }}) = 'pending' then 'Pending'
        else {{ column }}
    end
{% endmacro %}

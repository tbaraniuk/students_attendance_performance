{% macro handle_date_format(date_column) %}
    case
        when length({{ date_column }}) = 10 and {{ date_column }} like '%-%' and substring({{ date_column }}, 1, 2) <= '12' then
            strptime({{ date_column }}, '%m-%d-%Y')
        else
            cast({{ date_column }} as date)
    end
{% endmacro %}

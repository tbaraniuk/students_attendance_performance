{% macro normalize_score(score_column) %}
    case
        when {{ score_column }} > 100 then 100
        when {{ score_column }} < 0 then 0
        else {{ score_column }}
    end
{% endmacro %}
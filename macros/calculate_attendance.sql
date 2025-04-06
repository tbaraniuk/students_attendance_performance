{% macro calculate_attendance(status_column) %}
    sum(case when {{ status_column }} in ('present', 'left early') then 1 else 0 end) as days_present,

    sum(case when {{ status_column }} in ('absent', 'absnt', 'excused') then 1 else 0 end) as days_absent,

    sum(case when {{ status_column }} = 'late' then 1 else 0 end) as days_late
{% endmacro %}
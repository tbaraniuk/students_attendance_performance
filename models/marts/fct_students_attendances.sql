{{ config
    (
        materialized='incremental',
        unique_key = 'student_id'
    )
}}

with
source as (
    select
        student_id,
        date,
        month,
        year,
        subject,
        attendance_status
    from
        {{ ref('stg_attendances') }}
    {% if is_incremental() %}
        where date > (select max(cast(concat(cast(year as varchar), '-', lpad(cast(month as varchar), 2, '0'), '-01') as date)) from {{ this }})
    {% endif %}
),
attendances_grouped_statuses as (
    select
        student_id,
        year,
        month,
        {{ calculate_attendance('attendance_status') }}
    from
        source
    group by
        student_id, year, month
    order by
        year, month
)


select * from attendances_grouped_statuses
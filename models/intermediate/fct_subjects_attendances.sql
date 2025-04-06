with
grouped_attendances as (
    select
        subject,
        {{ calculate_attendance('attendance_status') }}
    from
        {{ ref('stg_attendances') }}
    group by
        subject
    order by
        subject
)

select * from grouped_attendances

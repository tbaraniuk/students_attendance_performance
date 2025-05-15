with
grade_students as (
    select
        s.grade_level,
        a.year,
        a.month,
        {{ calculate_attendance('a.attendance_status') }}
    from
        {{ ref('stg_students') }} as s
    left join
        {{ ref('stg_attendances') }} as a
            on s.student_id = a.student_id
    group by
        s.grade_level, a.year, a.month
)

select * from grade_students
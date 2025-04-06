with
joined_students_data as (
    select
        s.student_id,
        s.full_name,
        s.birth_date,
        s.grade_level,
        s.emergency_contanct,
        sp.mean_exam_score,
        sp.mean_homework_completion
    from
        {{ ref('stg_students') }} as s
    join
        {{ ref('fct_students_overall_performance') }} as sp
        on s.student_id = sp.student_id
)

select * from joined_students_data

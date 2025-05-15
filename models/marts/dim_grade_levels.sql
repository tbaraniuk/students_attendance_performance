with
joined_data as (
    select
        g.grade_level,
        g.students_count,
        gp.mean_exam_score,
        gp.mean_homework_completion
    from
        {{ ref('int_grades') }} as g
    left join
        {{ ref('fct_grades_performance') }} as gp
        on g.grade_level = gp.grade_level
    left join
        {{ ref('fct_latest_grades_attendances') }} as ga
        on ga.grade_level = g.grade_level
)

select * from joined_data
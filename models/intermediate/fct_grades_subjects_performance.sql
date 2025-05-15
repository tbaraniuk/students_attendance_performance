with
grades_grouped_performance as (
    select
        grade_level,
        subject,
        avg(exam_score) as mean_exam_score,
        avg(homework_completion) as mean_homework_completion
    from
        {{ ref('int_students_performances') }}
    group by
        grade_level, subject
    order by
        grade_level, subject
)

select * from grades_grouped_performance
with
students_performance as (
    select
        student_id,
        avg(exam_score) as mean_exam_score,
        avg(homework_completion) as mean_homework_completion
    from
        {{ ref('stg_performances') }}
    group by
        student_id
)

select * from students_performance

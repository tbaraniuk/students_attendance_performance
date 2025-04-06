with
performance_aggregated as (
    select
        subject,
        avg(exam_score) as avg_exam_score,
        min(exam_score) as min_exam_score,
        avg(homework_completion) as avg_homework_completion
    from
        {{ ref('stg_performances') }}
    group by
        subject
    order by
        subject
)

select * from performance_aggregated
with performance_with_ranks as (
    select
        student_id,
        subject,
        exam_score,
        rank() over (partition by subject order by exam_score desc) as subject_rank,
        count(*) over (partition by subject) as total_students_in_subject
    from {{ ref('stg_performances') }}
),
performance_classification as (
    select
        *,
        case
            when subject_rank <= total_students_in_subject * 0.33 then 'Top Performer'
            when subject_rank <= total_students_in_subject * 0.66 then 'Middle Performer'
            else 'Needs Support'
        end as performance_band
    from performance_with_ranks
)

select *
from performance_classification
order by subject, subject_rank

with
homework_aggregated as (
    select
        student_id,
        sum(case when hm_status = 'done' then 1 else 0 end) as completed_assignments,
        sum(case when hm_status = 'not done' then 1 else 0 end) as uncompleted_assignments,
        guardian_signature,
        sum(case when guardian_signature = 'yes' then 1 else 0 end) as signed_by_guardian
    from
        {{ ref('stg_homeworks') }}
    group by
        student_id, guardian_signature
)

select * from homework_aggregated

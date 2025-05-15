with
communications_date_populated as (
    select
        student_id,
        date,
        extract(year from date) as year,
        extract(month from date) as month,
        message_type,
        message_content
    from
        {{ ref('stg_teacher_parent_communications') }}
),
communications_message_type_grouped as (
    select
        student_id,
        year,
        month,
        message_type,
        count(message_content) as messages_count
    from
        communications_date_populated
    group by
        student_id, year, month, message_type
)

select * from communications_message_type_grouped
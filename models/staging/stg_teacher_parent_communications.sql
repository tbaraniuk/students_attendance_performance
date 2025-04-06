with
source as (
    select * from {{ ref('teacher_parent_communication') }}
),
modified as (
    select
        Student_ID as student_id,
        cast(Date as date) as date,
        Message_Type as message_type,
        Message_Content as message_content
    from
        source
)

select * from modified
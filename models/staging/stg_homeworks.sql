with
source as (
    select * from {{ source('minio_source', 'homework') }}
),
modified as (
    select
        Student_ID as student_id,
        Subject as subject,
        Assignment_Name as assignemnt_name,
        cast(Due_Date as date) as due_date,
        {{ transform_status('Status') }} as hm_status,
        Grade_Feedback as grade_feedback,
        {{ transform_yes_no('Guardian_Signature') }} as guardian_signature
    from
        source
)

select * from modified
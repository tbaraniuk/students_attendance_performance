with
source as (
    select * from {{ source('minio_source', 'attendance') }}
),
modified as (
    select
        Student_ID as student_id,
        cast(Date as date) as date,
        Subject as subject,
        {{ clean_string('Attendance_Status') }} as attendance_status
    from
        source
),
date_populated as (
    select
        student_id,
        date,
        extract(year from date) as year,
        extract(month from date) as month,
        subject,
        attendance_status
    from
        modified
)

select * from date_populated
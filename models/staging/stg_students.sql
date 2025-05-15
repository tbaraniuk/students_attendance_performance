with
source as (
    select * from {{ source('duckdb_source', 'students') }}
),
modified as (
    select
        Student_ID as student_id,
        Full_Name as full_name,
        {{ handle_date_format('Date_of_Birth') }} as birth_date,
        Grade_Level as grade_level,
        Emergency_Contact as emergency_contanct
    from
        source
)

select * from modified
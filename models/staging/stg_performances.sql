with
source as (
    select * from {{ source('minio_source', 'performance') }}
),
modified as (
    select
        Student_ID as student_id,
        Subject as subject,
        {{ normalize_score('Exam_Score') }} as exam_score,
        cast(
            {{ strip_percentage          ('Homework_Completion_%') }}
        as int)
        as homework_completion,
        Teacher_Comments as teacher_comments
    from
        source
),
normalized_exam_score_data as (
    select
        student_id,
        subject,
        exam_score,
        {{ normalize_score(
            'homework_completion'
        )
        }} as homework_completion,
        teacher_comments
    from
        modified
)

select * from normalized_exam_score_data
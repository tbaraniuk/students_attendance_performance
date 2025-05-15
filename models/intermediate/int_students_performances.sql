select
    p.student_id,
    p.subject,
    p.exam_score,
    p.homework_completion,
    s.grade_level
from
    {{ ref('stg_performances') }} as p
left join
    {{ ref('stg_students') }} as s
    on p.student_id = s.student_id

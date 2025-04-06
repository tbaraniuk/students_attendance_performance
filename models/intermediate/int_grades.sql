select
    grade_level,
    count(student_id) as students_count
from
    {{ ref('stg_students') }}
group by
    grade_level
order by
    grade_level asc
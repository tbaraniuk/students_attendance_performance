select
    s.grade_level,
    avg(sp.mean_exam_score) as mean_exam_score,
    avg(sp.mean_homework_completion) as mean_homework_completion
from
    {{ ref('fct_students_overall_performance') }} as sp
left join
    {{ ref('stg_students') }} as s
        on sp.student_id = s.student_id
group by
    s.grade_level
order by
    s.grade_level
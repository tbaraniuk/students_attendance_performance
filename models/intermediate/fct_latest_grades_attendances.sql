with
source as (
    select * from {{ ref('int_grades_attendances') }}
),
latest_months as (
    select
        year,
        month
    from
        source
    where year = (select max(year) from source)
    order by month desc
    limit 3
),
latest_grades_attendances as (
    select
        ga.*
    from
        source as ga
    inner join latest_months as lm
        on ga.year = lm.year and ga.month = lm.month
)

select * from latest_grades_attendances
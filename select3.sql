# group by - 그룹
# 집계 -> count, max, min, sum, avg

#NULL은 카운터 안됨
select
	admission_date,
	count(*)
    #count(student_name)
    #count(introduce)
from
	student_tb
group by
	admission_date;
	
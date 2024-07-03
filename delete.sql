# 데이터 삭제(DML - DELETE)

delete
from
	student_tb
where
	student_id = 2;




show databases;

use study;

select * from study.student_tb;

# 이메일 데이터 중 @앞에 bbb가 포함된 정보의 introduce 데이터를
# `bbb를 포함하고 있는 계정입니다.`라고 수정하고 student_id가 5~7인 데이터들을 삭제하시오.

update
	student_tb
set
	introduce = "bbb를 포함하고 있는 계정입니다."
where 
	email like "%bbb%@%";
	
delete
from
	student_tb
where
# 	student_id between 5 and 7; 
 	student_id > 4
	and student_id < 8;
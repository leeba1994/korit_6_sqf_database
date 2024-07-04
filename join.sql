#join
insert into join1_tb
values
	(0, "정령우"),
    (0, "백승주"),
    (0, "김정현"),
    (0, "김유진"),
    (0, "정찬익");
    
insert into join2_tb
values
	(0, "010-1111-1111"),
	(0, "010-2222-2222"),
	(0, "010-3333-3333"),
	(0, "010-4444-4444"),
	(0, "010-5555-5555");
    
insert into master_tb
values
	(0, 1, 1),
	(0, 1, 2),
	(0, 1, 3),
    (0, 2, 1),
    (0, 2, 2),
    (0, 3, 3),
    (0, 4, 4),
    (0, 5, 5),
    (0, 5, 1);

SELECT * FROM master_tb;    
SELECT * FROM join1_tb;
SELECT * FROM join2_tb;

#join실행순서 : select된 결과에 join 하겠다
select
	*
from
	master_tb mt
--    inner join join1_tb on(join1_tb.join1_id = 1)	#inner join - 교집합(and) on조건에 참이면 붙히겠다 
#	inner join join1_tb on(join1_tb.join1_id = master_tb.name_id and join1_tb.join1_id < 4)
    left outer join join1_tb jt1 on(jt1.join1_id = mt.name_id and jt1.join1_id < 4)	#left outer join - 왼쪽을 기준으로 오른쪽에 붙히겠다, 합집합(or) 
    left outer join join2_tb jt2 on(jt2.join2_id = mt.phone_id)
select @@autocommit;
set @@autocommit = 0;

# procedure 호출
call usp_add_master("이병안", "010-9999-8888");


set @total = 0;
call usp_mod_score("이병안", 60, 0, 90, @total);
select @total;

select * from join1_tb where name = "이병안";

select * from score_tb where name_id =17;

    select
		join1_id 
	from
		join1_tb
	where
		name = "이병안";

set @number = 10;

call usp_square(@number);

select @number;

select
	max(name_id)
from
	master_tb;
    
select
	add_number(10, 20);
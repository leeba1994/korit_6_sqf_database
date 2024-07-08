# 트랜잭션(Transaction)
# @@는 전역
#단계별 하나의 묶음
set @name = "김준일";
select @name;

select @@autocommit;
set autocommit = 0;

insert into master_tb
values
	(0, 6, 1);
    
commit;
    
SELECT * FROM dvd_db.master_tb;

# rollback을 하게되면 start transaction 다시 해야함.
start transaction;	# { 여기서 부터 시작

set @name = "권혁진";
set @phone = "010-6666-8888";

savepoint sp_insert_name;
insert into join1_tb
values(0, @name);

savepoint sp_insert_phone;
insert into join2_tb
values(0, @phone);

# rollback;
rollback to sp_insert_phone;

set @new_join1_id = 0;
set @new_join2_id = 0;

select
	join1_id into @new_join1_id
from
	join1_tb
order by
	join1_id desc
limit 0, 1;

select
	join2_id into @new_join2_id
from
	join2_tb
order by
	join2_id desc
limit 0, 1;


insert into master_tb
values(0, @new_join1_id, @new_join2_id);

commit;	# } 여기까지 1개의 트랜잭션
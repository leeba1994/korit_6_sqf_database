SELECT * FROM dvd_db.sample_dvd_tb;

insert into producer_tb
select
	distinct
    0,
	저작자
from
	sample_dvd_tb;

    
#insert into producer_tb
select
    0,
	저작자
from
	sample_dvd_tb
group by
	저작자;

-- insert into dvd_db.publisher_tb(publisher_name)
select
#	발행자,
	nullif(발행자, "")	#nullif - (발행자, "") 발행장컴럼이 공백이면 null로 변경해라
#    ifnull(nullif(발행자, ""), "발행자없음")	#ifnull - (nullif(발행자, ""), "발행자없음") nullif(발행자, "")값이 null이면 "발행자없음"으로 대체해라
#    ifnull(nullif(replace(발행자, " ", ""), ""), "발행자없음")
from
	sample_dvd_tb
group by
	발행자
having
	nullif(발행자, "") is not null;


-- insert into dvd_db.publisher_tb(publisher_name)
select
	nullif(발행자, "") as publisher_name
from
	sample_dvd_tb
group by
	발행자
having
	publisher_name is not null;
    
insert into dvd_tb
select
	0,
    등록번호,
    제목,
    pdt.producer_id,
    pbt.publisher_id,
    발행년,
    데이터기준일자
from
	sample_dvd_tb sdt
    left outer join producer_tb pdt on(pdt.producer_name = sdt.저작자)
    left outer join publisher_tb pbt on(pbt.publisher_name = sdt.발행자);
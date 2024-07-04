SELECT * FROM study.sample_dvd_tb;

SHOW TABLE STATUS WHERE name = "producer_tb"; #Auto_increment 확인

ALTER TABLE `producer_tb` AUTO_INCREMENT = 1; #AUTO_INCREMENT 초기화(변경)
SET @COUNT = 0;
UPDATE producer_tb SET producer_id = @COUNT:=@COUNT+1;

# producer데이터 정규화
insert into producer_tb(producer_name)
select
	producer
#	CHAR_LENGTH(producer) CHAR_LENGTH( 문자/칼럼 )  -  문자/칼럼의 문자 개수를 출력합니다
#    count(*)
from
	sample_dvd_tb
group by
	producer;
    
-- delete
-- from
-- producer_tb;

# producer null값 찾기

select
	*
from
	sample_dvd_tb
where
	producer is null;

# dvd_publisher데이터 정규화
insert into dvd_publisher_tb
select
	0,
	dvd_publisher
#	CHAR_LENGTH(dvd_publisher) as 글자수 # CHAR_LENGTH( 문자/칼럼 )  -  문자/칼럼의 문자 개수를 출력합니다
#    count(*)
from
	sample_dvd_tb
group by
	dvd_publisher;

# dvd_publisher null값 찾기
select
	*
from
	sample_dvd_tb
where
	dvd_publisher is null;
    
-- 정규화된 데이터 매칭
update
	sample_dvd_tb as sdt
    left outer join producer_tb as pt on(pt.producer_name = sdt.producer)
    left outer join dvd_publisher_tb dpt on(dpt.dvd_publisher_name = sdt.dvd_publisher)
set
	sdt.producer_id = pt.producer_id,
    sdt.dvd_publisher_id = dpt.dvd_publisher_id;
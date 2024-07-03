SELECT * FROM book_tb;
-- Group by 집계, 중복제거

select
	distinct 
    category_id,	#중복이 제거된 결과
    publisher_id
from
	book_tb;


-- 실행순서 from > where > group by > select
select
	category_id,
    count(*)
from
	book_tb
where
	book_id > 7000
group by
	category_id;
    
-- 도서명 중 '돈'이라는 글자가 들어간 데이터들을 찾아 카테고리별로 묶으시오.
-- 그리고 카테고리 별로 도서 개수가 출력되어야한다.
-- 카테고리 카운터가 10보다 큰 값만 출력
select
	category_id,
    count(*) as category_count
from
	book_tb
where
	book_name like "%돈%"
group by
	category_id;

-- 서브쿼리는 select 3개안에서 하기 
select
	*
from
	(select
		category_id,
		count(*) as category_count
	from
		book_tb
	where
		book_name like "%돈%"
	group by
		category_id) as temp_category_tb
where 
	category_count > 10;

-- 실행순서 from > where > group by > select > having
select
	category_id,
	count(*) as category_count
from
	book_tb
where
	book_name like "%돈%"
group by
	category_id
having
	category_count > 10;
select
	*
from
	sample_book_tb;

-- insert select
-- 도서관 정보 테이블 데이터 추출
# insert into library_tb(library_name, library_code, library_url)
select
	도서관명,
    도서관구분코드,
    도서관홈페이지
from
	sample_book_tb
group by
	도서관명,
    도서관구분코드,
    도서관홈페이지;

-- insert select
-- 카테고리(category_tb) 정보 테이블 데이터 추출
# insert into category_tb
select
	0,
	카테고리
--    count(*) 
from
	sample_book_tb
group by
	카테고리;
    

-- 출판사 정보 테이블 데이터 추출
# insert into publisher_tb
select
	0,
	출판사
from
	sample_book_tb
group by
	출판사;
    

-- 형식 정보 테이블 데이터 추출

# insert into book_type_tb
select
	0,book_type_tb
	형식
from
	sample_book_tb
group by
	형식;
    
    
select
	도서관구분코드,
	도서명,
    저자명,
    `국제표준도서번호(ISBN)`,
	카테고리,
    출판사,
    표지주소(URL),
    형식
from
	sample_book_tb;
    
    
-- 정규화된 데이터 매칭
update
	sample_book_tb as sbt
    left outer join library_tb as lt on(lt.library_name = sbt.도서관명)
    left outer join category_tb ct on(ct.category_name = sbt.카테고리)
    left outer join publisher_tb pt on(pt.publisher_name = sbt.출판사)
    left outer join book_type_tb btt on(btt.book_type_name = sbt.형식)
set
	도서관ID = lt.library_id,
    카테고리ID = ct.category_id,
    출판사ID = if(sbt.출판사 = "", null, pt.publisher_id), #삼항연산자
    형식ID = btt.book_type_id;


# insert into book_tb
select
	0,
	도서관ID,
    도서명,
    저자명,
    `국제표준도서번호(ISBN)`,	
    카테고리ID,
    출판사ID,
    `표지주소(URL)`,
    형식ID
from
	sample_book_tb;
    
select
distinct 
	library_id,
    book_name,
    author_name,
    isbn,	
    category_id,
    publisher_id,
    book_poster_url,
    book_type_id
from
	book_tb;

delete
from
	book_tb
where book_id > 9911;
	
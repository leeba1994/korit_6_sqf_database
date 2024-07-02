# 데이터 삽입(DML - INSERT)

select * from student_tb;

# insert into 'study'.'student_tb'  Database가 use되지 않은 경우
# insert into 'student_tb'			Database가 use상태인 경우
insert into student_tb				#단건
	(student_id, student_name, phone, email, admission_date)
values
	(0, "김준일", "010-9988-1916", "skjil1218@kakao.com", now());
    
insert into student_tb				#다건
	(student_id, student_name, phone, email, admission_date)
values
	(0, "김준이", "010-9988-1916", "skjil1218@kakao.com", now()),
    (0, "김준삼", "010-9988-1916", "skjil1218@kakao.com", now()),
    (0, "김준사", "010-9988-1916", "skjil1218@kakao.com", now());
    
insert into student_tb				#단건
	(student_id, student_name, phone, email,introduce, admission_date)
values
	(0, "김준오", "010-9988-1916", "skjil1218@kakao.com", null, now());
    
insert into student_tb				#단건 컴럼의 순서로 작성하기
	(student_id, phone, email,introduce, student_name, admission_date)
values
	(0, "010-9988-1916", "skjil1218@kakao.com", null, "김준육", now());
    
insert into student_tb				#단건 컴럼명을 생략할떄 값을 전부입력하고 순서가 맞아야한다
values
	(0, "김준칠", "010-9988-1916", "skjil1218@kakao.com", null, now());

select * from car_tb;

insert into car_tb
	(car_id, car_model, car_color, car_date)
values
	(0, "그렌저", "화이트", now());
    
insert into car_tb
	(car_model, car_color, car_date)
values
	("그렌저", "화이트", now());
    
insert into car_tb
	values
    (0, "M4", "블랙", now());
    
insert into car_tb
	(car_color, car_date)
values
	("화이트", now());
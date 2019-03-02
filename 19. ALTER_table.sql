## ================================================

-- ALTER
-- 테이블 컬럼 수정하기 (값 추가, 컬럼명 수정, type 수정, 삭제)
desc test_table1;

## =================================================

-- ALTER add
-- 그냥 추가하면 맨뒤로 붙는다
alter table test_table1 
add test varchar(20); 

-- test 이후에 추가 
alter table test_table1 
add test2 varchar(20) after test; 

-- 맨앞으로 붙어라
alter table test_table1 
add test3 varchar(20) first;
 
## =================================================

-- ALTER modify
-- 컬럼 type 변경
# 보통 컬럼 자료형 크기를 키우려고 사용한다
# 만약 크기를 줄이거나, 변환할 수 없는 자료형을 쓸 경우 안에 값이 망가질 수 있다.

alter table test_table1
modify test3 int;

## =================================================

-- ALTER change
-- 컬럼명 & 컬럼 타입 변경
alter table test_table1
change test test5 char(250);  # test 컬럼을 test5 컬럼으로 이름을 바꾸고, 자료형도 char(250)으로 바꾸기

## =================================================

-- ALTER drop
-- 컬럼 삭제
alter table test_table1
drop test3;




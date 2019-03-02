
-- 데이터베이스 만들기

# mysql 8.0 이상 : 기본 문자열 인코딩이 utf8
# mysql 5.7 이하 : 기본 문자열 인코딩이 latin1
create database testdb1;

# mysql 5.7 이하인 경우
create database testdb2
character set = 'utf8'
collate = 'utf8_general_ci';

-- 디비 생성시 안정장치
create database if not exists my_db;

## ===========================================================

-- 사용할 데이터베이스 선택하기
use testdb1;

-- 데이터베이스 이름 바꾸기
rename table test_table1 to test_table2;

## ===========================================================

-- 데이터베이스 삭제하기
drop database testdb1;
drop database testdb2;

-- 디비 삭제 안정장치
drop database if exists my_db;

## ===========================================================
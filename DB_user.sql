-- 사용자 생성
-- 오직 로컬 서버상에서만 접속 가능
create user 'guest'@'localhost' identified by '1234';

-- 모든 IP에서 접근해도 다 OK
-- 51.2.3.% or %.naver.com
create user 'guest2'@'%' identified by '1234';

-- 권한 부여
-- *.* : 모든 디비와 모든 그안에 테이블
grant all on *.* to 'guest2'@'%' with grant option;

-- 권한 제거
revoke delete on *.* from 'guest2'@'%';

-- 권한 확인 => 확인 => show
show grants for 'guest'@'localhost';

-- 비번변경
set password for 'guest'@'localhost'=password('12345');

-- 사용자 삭제
drop user 'guest'@'localhost';

-- ==================================================
-- 데이터베이스 생성
create database my_db;

-- 존재하는 모든 데이터베이스 확인
show databases;

-- 특정 디비를 사용하겟다
use my_db;

-- 디비 생성시 안정장치
create database if not exists my_db;

-- 디비 삭제
drop database if exists my_db;

-- =========================================
-- 테이블 생성쿼리 확인
show create table movie_rank;

-- 테이블을 다 보여라 
show tables;

-- 테이블의 상세한 구조를 보고 싶다
describe movie_rank;

-- 변경 -> alter
-- 그냥 추가하면 맨뒤로 붙는다
alter table users add test varchar(20); 
describe users;

-- uid 이후에 추가 
alter table users add test2 varchar(20) after uid; 
describe users;

-- 맨앞으로 붙어라
alter table users add test3 varchar(20) first; 
describe users;

-- 컬럼 변경
alter table users modify test3 varchar(30);
describe users;

-- 컬럼 삭제
alter table users drop test3;
describe users;

-- 테이블 삭제
drop table if exists 테이블명;

-- insert, update, delete, 
delete from users where uid='m2';
-- select (join, union 활용)
-- 함수
select avg(score), min(score), max(score),
sum(score), count(score) 
from movie_rank;

-- 데이터가 중복적으로 많이 존재한다
-- 특정 영화의 평점의 개수
select title, count(*) from movie_rank group by title;

-- 조인
-- 자료실 게시판 작성자들의 이름을 구하시오



create database testdb1;
use testdb1;

## ================================================

-- CREATE
-- 테이블 생성하기
create table test_table1 (
test_int int,
test_string char(50),
test_varchar varchar(200),
test_date date
);

-- 테이블 정보 조회
desc test_table1;

## ================================================

-- DROP
-- 테이블 삭제하기
drop table test_table1;

-- 테이블 삭제 안정장치
drop table if exists 테이블명;

## ================================================

-- 서브쿼리를 사용한 테이블 만들기 (내용을 가져다 채움)
# 사원번호, 현재 근무하고 있는 부서의 이름이 저장된 테이블 만들기
use employees;

create table test_table2
as
select de.emp_no, d.dept_name
from departments d, dept_emp de
where de.dept_no = d.dept_no
	  and de.to_date = '9999-01-01'
order by de.emp_no;

select * from test_table2;

## ================================================

-- 구조를 복제해서 테이블 만들기 (내용은 채우지 않음)
# employees 테이블의 emp_no와 first_name, last_name 컬럼만 복제한 새로운 테이블을 만든다.

create table test_table4
as
select emp_no, first_name, last_name
from employees
where 1=0;

desc test_table4;

select * from test_table4;


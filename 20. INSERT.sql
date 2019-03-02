
create database if not exists testdb2;
use testdb2;
create table if not exists test_table1 (
test_int int,
test_char char(100),
test_varchar varchar(100),
test_date date
);

desc test_table1;
select * from test_table1;

## =====================================================

-- INSERT --
# 테이블에 값 추가하기 
insert into test_table1
(test_int, test_char, test_varchar, test_date)
values (1, 'char1', 'varchar1', '2018-01-31');

# 컬럼명을 생략하면 desc 테이블명으로 조회했을 때 나오는
# 컬럼의 순서대로 값이 들어간다.
insert into test_table1
values (2, 'char2', 'varchar2', now());

# 컬럼 목록을 나열해주면 순서를 자유롭게 설정할 수 있다.
insert into test_table1
(test_date, test_varchar, test_char, test_int)
values (now(), 'varchar3', 'char3', 3);

# 컬럼을 일부만 사용한다.
# 생략된 컬럼에는 null 값이 저장된다.
insert into test_table1
(test_int, test_char)
values (4, 'char4');

insert into test_table1
(test_int, test_char, test_varchar, test_date)
values (5, 'char5', null, null);

## =========================================================

# 나열한 컬럼 목록의 개수와 값의 개수가 다를 경우
# 컬럼의 개수와 값의 개수가 다르면 오류가 난다

# 입력된 자료형이 다르면 자동으로 변환되어 저장된다
# 단, 도저히 바꿀 수 없을 때는 오류가 난다. (ex. 'abc'를 int 에 넣으려는 경우)

## =========================================================

use employees;

desc employees;

create table test_table5(
int_data int,
str_data varchar(100)
);

select * from test_table5;

## =========================================================

-- 서브쿼리를 이용한 테이블 값 추가

# employees 테이블에서 사원번호, first_name을 가져와 test_table5에 저장한다.
insert into test_table5
	   (int_data, str_data)
select emp_no, first_name
from employees
where emp_no in(10001, 10002, 10003);

insert into test_table5
select emp_no, first_name
from employees
where emp_no in(10004, 10005, 10006);


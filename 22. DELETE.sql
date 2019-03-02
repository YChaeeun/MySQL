
create table test_table10
as
select * from employees
where emp_no >= 10001 and emp_no <= 10050;

create table test_table11
as
select * from employees
where emp_no >= 10001 and emp_no <= 10050;

## ==================================================

-- DELETE
# 테이블의 값을 제거

## ==================================================

-- 조건절 없이 DELETE 
-- 모든 값을 삭제

delete from test_table10;

## ==================================================

-- 조건절이 있는 DELETE

# 남자 사원의 정보를 모두 삭제한다
delete from test_table11
where gender = 'M';

select * from test_table11;
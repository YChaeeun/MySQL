#  LIMIT
# 시작 로우 위치(0부터 시작), 가져올 개수를 정할 때
# MySQL은 기본적으로 LIMIT 0, 1000 을 가지고 있음

select * from employees
limit 0,10;

select * from employees
limit 10, 10;

# 현재 받고 있는 급여액이 가장 많은 10명의 사원번호와 급여액을 가져온다
select emp_no, salary
from salaries
where to_date ='9999-01-01'
order by salary desc
limit 0,10;

# 가장 최근에 입사한 10명의 사원번호와 입사일을 가져온다
select emp_no, hire_date
from employees
order by hire_date desc
limit 0, 10;
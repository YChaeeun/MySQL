# 그룹함수
# 그룹함수는 제일 나중에 작성하는 게 좋음!

# count()
# avg(), sum()
# max(), min()

## ======================

# 사원의 수를 가져온다
select count(*)
from employees;

# 여자사원의 수를 가져온다
# 여자사원의 데이터를 가져오고 -> 그룹함수 count 쓰기
select count(*)
from employees
where gender = 'F';

#d005 부서의 "현재" 근무하고 있는 사원들의 수를 가져온다
select count(*)
from dept_emp
where dept_no = 'd005' and to_date = '9999-01-01';

# 현재 받고 있는 급여의 총합, 평균, 최고, 최저액을 가져온다
select sum(salary), round(avg(salary)), max(salary), min(salary)
from salaries
where to_date ='9999-01-01';

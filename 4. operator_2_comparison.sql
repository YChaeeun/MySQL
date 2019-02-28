-- comparison_operator
# =, <>
# >, <, <=, >=

# d005 부서에 근무하고 있는 사원들의 사원번호, 근무 부서번호를 가져온다
select emp_no, dept_no
from dept_emp
where dept_no = 'd005';

# 부서번호가 d005 가 아닌 사원들의 사원번호, 부서번호를 가져온다
select emp_no, dept_no
from dept_emp
where dept_no <> 'd005';

# 급여액이 150000 이상인 사원의 사원번호, 급여액을 가져온다
select emp_no, salary
from salaries
where salary >= 150000;

# 급여액이 40000 이하인 사원들의 사원번호, 급여액을 가져온다
select emp_no, salary
from salaries
where salary <= 40000;

#1986년 이후에 입사한 사원들의 사원번호 입사일, 성과 이름을 가져온다
select emp_no, hire_date, first_name, last_name
from employees
where hire_date > '1986-12-31';

# 1990년 이후에 매니저가 된 사원들의 사원번호, 부서번호, 매니저 시작 날짜를 가져온다
select emp_no, dept_no, from_date
from dept_manager
where from_date >= '1991-01-01';

# 1990년 이전에 입사한 사원들의 사원번호, 입사일을 가져온다
select emp_no, hire_date
from employees
where hire_date < '1990-01-01';

# 모든 직원들의 사원번호, 현재 연봉을 가져온다
# 현재 : 종료날짜가 9999-01-01 로 설정되어 있음
select *
from salaries
where to_date = '9999-01-01';

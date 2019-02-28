# 특정 컬럼을 기준으로 오름차순, 내림차순으로 로우를 정렬할 수 있다.
-- Every data can be ordered by ORDER BY

# ORDER BY 정렬기준 컬럼 [desc/asc]
# asc 혹은 생략 : 오름차순 정렬
# desc : 내림차순 정렬

-- steps for EASY writing 
# from -> where -> select -> order by

# 사원의 번호와 급여를 가져온다
# 급여를 기준으로 오름차순 정렬한다.
select emp_no, salary
from salaries
order by salary asc;

# 사원의 번호와 급여를 가져온다
# 급여를 기준으로 내림차순 정렬한다.
select emp_no, salary
from salaries
order by salary desc;

# 사원의 번호와 급여를 가져온다
# 급여를 기준으로 오름차순, 만약 동일한 값이 있을 경우, 사원번호를 기준으로 내림차순
select emp_no, salary
from salaries
order by salary, emp_no desc;

-- ===============================================================

# first_name을 기준으로 내림차순 정렬한다, 동일한 이름이 있을 경우 사원번호로 오름차순
select emp_no, first_name
from employees
order by first_name desc, emp_no;

# 입사일을 기준으로 오름차순 한 사원의 사원번호, 입사일을 가져온다
select emp_no, hire_date
from employees
order by hire_date;

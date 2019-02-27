
# select : 테이블에서 데이터를 가져올 때 사용
# use to get data from the table

# distinct : 중복되지 않게 정보를 가져옴

# where : 조건을 주고, 조건에 맞는 정보만 가져옴

# select _need_data_
# from _table_name_

-- EASIER way to write SELECT query
# 0. look up to the structure of database and decide where to get data
# 1. write the keyword first (ex. select, from ... )
# 2. fill keyword 'from' first => table name
# 3. then, start filling up from the top

# 사원의 정보를 모두 가져온다. 
select *
from employees;

# 부서 정보를 모두 가져온다
select *
from departments;

# 사원들의 직함 정보를 모두 가져온다
select *
from titles;
-- ===================================

# 사원들의 사원번호, 이름을 가져온다
select emp_no, first_name, last_name
from employees;

# 사원들의 사원번호, 생년월일, 성별을 가져온다
select emp_no, birth_date, gender
from employees;

# 여자인 사원들의 사원번호, 이름, 성별을 가져온다
select emp_no, first_name, gender
from employees
where gender='F';

-- =====================================

# 부서의 부서번호, 부서 이름을 가져온다
select dept_no, dept_name
from departments;

# 부서 번호를 중복되지 않게 가져오기
select distinct dept_no
from departments; 

# 부서 번호가 d001인 부서에 근무하는 직원들의 사원번호와 부서번호를 가져온다
select emp_no, dept_no
from dept_emp
where dept_no = 'd001';

-- =========================================

# 각 사원의 사원번호, 급여액을 가져온다
select emp_no, salary 
from salaries;

# 각 사원의 사원번호, 직함 이름을 가져온다.
select emp_no, title
from titles;

# 각 사원들의 직함을 중복되지 않게 가져온다
select distinct title
from titles;

# 사원 직함이 Staff 인 직원들의 사원번호를 가져온다
select emp_no, title
from titles
where title = 'Staff';
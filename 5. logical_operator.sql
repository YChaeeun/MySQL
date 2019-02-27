# logical operator
-- and, or, not
-- between and, in

-- and --
# d001 부서의 매니저 중에서 1990년 이후부터(포함) 매니저인 사원의 사원번호, 부서번호, 매니저 시작 날짜를 가져온다
select emp_no, dept_no, from_date
from dept_manager
where dept_no = 'd001' and from_date >= '1990-01-01';

# 1990년 이후에(포함) 입사한 여자사원의 사원번호, 성별, 입사일을 가져오기
# 성별 F - 여자, M - 남자
select emp_no, gender, hire_date
from employees
where hire_date >= '1990-01-01' and gender = 'F';

# 1990년 이후부터(포함) 60000 이상의 급여를 받는 사원의 사원번호, 급여, 급여 수령 시작날짜를 가져온다
select emp_no, salary, from_date
from salaries
where from_date > '1990-01-01' and salary >= 60000;

-- ======================================================

-- or --
# d001 부서와 d002 부서 매니저의 사원번호, 부서번호를 가져온다
select emp_no, dept_no
from dept_manager
where dept_no = 'd001' or dept_no = 'd002';

# 직함이 Staff인 사원과 Engineer인 사원의 사원번호, 직함을 가져온다
select emp_no, title
from titles
where title = 'Staff' or title='Engineer';

-- ======================================================

-- not--
# 부서번호가 d003이 아닌 매니저의 사원번호와 부서번호를 가져온다
-- not을 쓰지 않으면?
select emp_no, dept_no
from dept_manager
where dept_no <> 'd003';

-- not을 쓴다면?
select emp_no, dept_no
from dept_manager
where not dept_no = 'd003';

-- ======================================================

-- between and --
# 급여가 60000 이상 70000 이하인 사원들의 사원번호, 급여를 가져온다
-- and를 쓴다면?
select emp_no, salary
from salaries
where salary >= 60000 and salary <= 70000;

-- between and를 쓴다면?
select emp_no, salary
from salaries
where salary between 60000 and 70000;

## ======================================================

-- in --
# d001 부서와 d002 부서에 근무하고 있는 부서 매니저의 사원번호, 부서번호를 가져온다.
-- or 쓴다면?
select emp_no, dept_no
from dept_manager
where dept_no = 'd001' or dept_no = 'd002';

-- in 을 쓴다면?
select emp_no, dept_no
from dept_manager
where dept_no in ('d001', 'd002');

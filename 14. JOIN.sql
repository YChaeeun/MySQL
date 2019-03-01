# JOIN
# 공통부분이 한개 이상 있는 테이블들을 묶어서 정보 가져오기
-- 공통부분 : 정확히 동일한 정보를 담고 있는 컬럼, 단순히 이름이 같은 걸 의미하는 게 아니야

# 만약 공통 부분이 없다면 중간 다리 역할을 해줄 다른 테이블을 껴서 세 개의 테이블을 조인하면 됨
# 테이블 별칭을 줘서 어떤 테이블의 컬럼인지 표시하기 -> 유지보수에도 용이

-- 작성 순서
# from 작성, 테이블 별칭 부여 -> where 조인할 조건 작성 -> 00 -> select 가져올거 작성 -> order by 작성

## =================================================================

-- A : 사원번호, 근무부서번호 가져오기
select emp_no, dept_no
from dept_emp
where to_date = '9999-01-01'
order by dept_no;

-- B : 근무부서 이름 가져오기
select dept_no, dept_name
from departments
order by dept_no;

-- A랑 B를 조인!
select d.dept_no, d.dept_name, de.emp_no
from dept_emp as de, departments d 
where de.dept_no = d.dept_no
	  and de.to_date = '9999-01-01'
order by dept_no;

## ===================================================================

-- 각 사원들의 사원번호, 이름(first_name, 현재 근무하고 있는 부서 번호 가져오기)
select de.emp_no, de.dept_no, e.first_name
from dept_emp de, employees e
where de.emp_no = e.emp_no
	  and de.to_date = '9999-01-01'
order by dept_no;


-- 각 사원들의 사원번호, first_name, 현재 받고 있는 급여를 가져온다
select e.emp_no, e.first_name, s.salary
from employees e, salaries s
where e.emp_no = s.emp_no
	  and to_date = '9999-01-01'
order by e.emp_no;

## ===================================================================

-- 각 사원들의 사원번호, first_name, 현재 근무 부서 이름을 가져온다
select e.emp_no, e.first_name, d.dept_name
from employees e, departments d, dept_emp de
where de.to_date = '9999-01-01'
	  and de.dept_no = d.dept_no
      and de.emp_no = e.emp_no
order by e.emp_no;


-- Finance 부서에 근무하고 있는 사원들이 현재 받고 있는 급여액의 총합과 평균을 가져온다
select sum(s.salary), avg(s.salary), round(avg(s.salary),0)
from salaries s, dept_emp de, departments d
where s.to_date = '9999-01-01'
	  and s.emp_no = de.emp_no
      and de.dept_no = d.dept_no
	  and d.dept_name = 'Finance'
order by s.emp_no;


# SUBquery
# : 쿼리문 안에 또 쿼리문이 있는 경우
# : 조건문을 만들 때, 값을 직접 지정하지 못하고 쿼리문을 통해 구해야 할 경우에 사용
# : 값을 여러 개를 반환하는 경우에는 in 을 사용

# 보통 서브쿼리로 할 수 있는건 조인으로도 할 수 있어서 둘 중에 편한 방법으로 하면 됨

## =========================================================================

-- 현재 받는 급여의 평균보다 많이 받는 사원들의 사원번호, 급여액을 가져온다
# (현재 받는 급여의 평균 구하기, 이를 조건으로 -> 사원들의 번호와 급여액 가져오기)
select emp_no, salary
from salaries
where to_date = '9999-01-01' 
	  and salary > (select avg(salary)		# 평균 급여액
					from salaries
					where to_date = '9999-01-01');
                    
-- 사원번호 10001 사원과 같은 날 입사한 사원들의 사원번호와 first_name을 가져온다
select emp_no, first_name
from employees
where hire_date = (select hire_date
				   from employees
                   where emp_no = 10001
					);

## =========================================================================

-- d001 부서에 근무하고 있는 사원들의 사원번호와 first_name을 가져온다
# 조인으로 하기
select de.dept_no, e.emp_no, e.first_name
from employees e, dept_emp de
where de.to_date = '9999-01-01'
	  and e.emp_no = de.emp_no
      and de.dept_no = 'd001'
order by de.dept_no;
      
# 서브쿼리로 하기
# (d001 부서에 근무하고 있는 사원들의 번호, 이를 조건으로 사원번호와 first_name 가져오기)
select emp_no, first_name
from employees
where emp_no in (select emp_no
				from dept_emp
				where dept_no = 'd001'
					  and to_date = '9999-01-01')
order by emp_no;

## =========================================================================

-- Development 부서의 현재 매니저의 사원번호와 이름을 가져온다
select emp_no, first_name
from employees 
where emp_no in (select emp_no
				 from dept_manager
				 where to_date ='9999-01-01'
					   and dept_no = (select dept_no
									  from departments
                                      where dept_name = 'Development')
					);
                                    
-- Finance 부서에 근무하고 있는 사원들의 현재 받고 있는 급여액의 총합과 평균을 가져온다 
select sum(salary), round(avg(salary),0)
from salaries
where to_date = '9999-01-01'
	  and emp_no in (select emp_no
					 from dept_emp
                     where to_date = '9999-01-01'
							and dept_no = (select dept_no
										   from departments
                                           where dept_name = 'Finance')
                     );

## =========================================================================

-- 전체 평균 급여보다 급여 평균이 더 많은 부서의 부서명과 급여 평균을 가져온다
select d.dept_name, round(avg(salary), 0)
from departments d, salaries s, dept_emp de
where s.to_date = '9999-01-01'
	  and d.dept_no = de.dept_no
      and s.emp_no = de.emp_no
      and de.to_date = '9999-01-01'
group by d.dept_no
having avg(s.salary) > (select avg(salary)
					  from salaries
                      where to_date = '9999-01-01')
order by d.dept_name;

-- 현재까지 매니저가 4명 이상인 부서에 근무하고 있는 사원들의 급여 평균을 가져온다
select avg(salary)
from salaries
where to_date='9999-01-01'
	  and emp_no in (select emp_no
					from dept_manager
                    where dept_no in (select dept_no
									  from dept_manager
                                      group by dept_no
                                      having count(emp_no)>=4)
					);

# 현재까지 매니저가 4명 이상인 부서
select dept_no
from dept_manager
group by dept_no
having count(*) >= 4; 

# 현재까지 부서마다 매니저의 수
select dept_no, count(*)
from dept_manager
group by dept_no;
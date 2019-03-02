use employees;

create table copy_emp
as
select * from employees;

select * from copy_emp 
order by hire_date desc;

## =======================================================

-- UPDATE
# update할때는 중간에 정보 확인한다고 중간중간 실행하면 안돼.....

# 워크벤치에서 조건절이 없는 update와 delete 문은 동작이 되지 않도록 막고 있다.
# 왜냐하면 실수로 데이터를 날려버리거나, 모두 동일하게 넣어버리는 경우 등등 혹시모를 사태를 예방하기 위해서!!

# 우리는 이 부분을 해지할 거야 (실무에서는 절대절대 해제하면 안돼....!!!!)
# Edit > preferences 메뉴 > SQL Editor > 맨 아래에 있는 Safe Update 체크해제 

## =======================================================

update copy_emp
set first_name = 'abe', last_name = 'kkk';

# 사원번호 10001인 사원의 생일을 오늘로 설정한다
update copy_emp
set birth_date = curdate()
where emp_no = 10001;

## =======================================================

# 평균 급여액보다 더 적게 받는 사원들의 입사날짜를 오늘로 변경하기
# 테이블은 꼭 copy_emp 사용하기!!
update copy_emp
set hire_date = curdate()
where emp_no in (select emp_no
				from salaries
				where to_date = '9999-01-01'
					  and salary < (select avg(salary)
									from salaries
									where to_date = '9999-01-01'));
# 평균 급여액
select copy_emp, salary
from salaries
where to_date = '9999-01-01'
	  and salary < (select avg(salary)
					from salaries
                    where to_date = '9999-01-01');
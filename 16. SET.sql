
# SET
# : 집합 연산을 하기 위해서는 두 select문을 통해 가져오는 컬럼이 같아야 함

# 합집합 : union(), union all, 중복된 데이터는 하나만 가진다
# 교집합 : join 문을 대신 사용
# 차집합 : 서브쿼리로 대신 사용

select emp_no
from titles
where title = 'Senior Staff';
      
select emp_no
from titles
where title = 'Staff';

## ================================================

-- 합집합 union
# 값을 하나만 가진다
select emp_no
from titles
where title = 'Senior Staff'
union
select emp_no
from titles
where title = 'Staff';

-- 합집합 2 union all
# 중복되는 것까지 모두 포함
select emp_no
from titles
where title = 'Senior Staff'
union all		
select emp_no
from titles
where title = 'Staff';

## ================================================

# 교집합 JOIN
# 중복되는 부분만 가져옴
select t1.emp_no, t1.title, t2.title
from titles t1, titles t2
where t1.emp_no = t2.emp_no
	  and t1.title = 'Senior Staff'
      and t2.title = 'Staff';
            
## ================================================

# 차집합 Subquery
select emp_no
from titles
where title = 'Senior Staff'
	  and emp_no not in (select emp_no
						 from titles
						 where title = 'Staff');
                         
## ================================================                         

# d001 부서에 근무하고 있는 사원들 중 직함이 staff 가 아닌 사원의 사원번호를 가져온다
# 차집합! 
# (d001에 근무하고 있는 사원) - (직함이 staff인 사원)
select emp_no
from dept_emp
where dept_no = 'd001'
	  and to_date = '9999-01-01'
      and emp_no not in (select emp_no
						 from titles
                         where title = 'Staff'
								and to_date = '9999-01-01');
